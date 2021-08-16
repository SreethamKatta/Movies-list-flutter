import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Add movies';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
}
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: "Enter a movie name",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a movie name';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: "Enter the director name",

            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the director name ';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {

                if (_formKey.currentState.validate()) {

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Movie added')),
                  );
                }
              },
              child: const Text('Add'),
            ),
          ),
        ],
      ),
    );
  }
}