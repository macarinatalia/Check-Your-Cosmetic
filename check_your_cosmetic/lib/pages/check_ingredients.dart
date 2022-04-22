import 'package:flutter/material.dart';

class CheckIngredientsPage extends StatefulWidget {
  const CheckIngredientsPage({Key? key}) : super(key: key);

  @override
  State<CheckIngredientsPage> createState() => _CheckIngredientsPage();
}

class _CheckIngredientsPage extends State<CheckIngredientsPage> {
  final _ingredientsFromPictureController = TextEditingController();

  @override
  void dispose() {
    _ingredientsFromPictureController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Ingredients'),
        centerTitle: true,
      ),
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _ingredientsFromPictureController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
              maxLines: 10,
            ),
            TextButton(
              onPressed: _checkIngredientsForm,
              child: Text(
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

  void _checkIngredientsForm() {
    print('Ingredients to check: ${_ingredientsFromPictureController.text}');
  }
}
