import 'dart:developer';

import 'package:check_your_cosmetic/brands.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CheckBatchcodeFormPage extends StatefulWidget {
  const CheckBatchcodeFormPage({Key? key}) : super(key: key);

  @override
  State<CheckBatchcodeFormPage> createState() => _CheckBatchcodeFormPage();
}

class _CheckBatchcodeFormPage extends State<CheckBatchcodeFormPage> {
  final _formKey = GlobalKey<FormState>();
  late Future<BrandsList> _brandsList;

  Brand? _selectedBrand;

  final _batchcodeController = TextEditingController();

  @override
  void dispose() {
    _batchcodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _brandsList = getBrandsList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Batchcode'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            FutureBuilder(
                future: _brandsList,
                builder: (context, AsyncSnapshot<BrandsList> snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButtonFormField<Brand>(
                      decoration: const InputDecoration(
                        labelText: 'Select Brand *',
                        enabledBorder: myFieldStyle.enabledBorderStyle,
                      ),
                      value: _selectedBrand,
                      items: snapshot.data!.brands.map((Brand brand) {
                        return DropdownMenuItem<Brand>(
                          child: Text(brand.name),
                          value: brand,
                        );
                      }).toList(),
                      onChanged: (newBrand) {
                        setState(() {
                          _selectedBrand = newBrand;
                        });
                      },
                      validator: (brand) =>
                          brand == null ? 'Brand is required' : null,
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error in fetching the brands');
                  }
                  return const Center(child: CircularProgressIndicator());
                }),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _batchcodeController,
              decoration: const InputDecoration(
                labelText: 'Batchcode *',
                enabledBorder: myFieldStyle.enabledBorderStyle,
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(15),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: _checkBathcodeForm,
              child: const Text(
                'Check',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
            ),
          ],
        ),
      ),
    );
  }

  void _checkBathcodeForm() {
    if (_formKey.currentState!.validate()) {
      print('Brand: ${_selectedBrand!.name}');
      print('Batchcode: ${_batchcodeController.text}');
    }
  }
}

class myFieldStyle {
  static const enabledBorderStyle = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(20)),
  );
}
