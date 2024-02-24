// ignore_for_file: avoid_print, use_key_in_widget_constructors, file_names, todo, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'dart:math';

import 'package:dmit2504_assignment_02/main.dart';
import 'package:flutter/material.dart';
import './widgets/mysnackbar.dart';

// Do not change the structure of this files code.
// Just add code at the TODO's.

final formKey = GlobalKey<FormState>();

// We must make the variable firstName nullable.
String? firstName;
final TextEditingController textEditingController = TextEditingController();

class MyFirstPage extends StatefulWidget {
  @override
  MyFirstPageState createState() => MyFirstPageState();
}

class MyFirstPageState extends State<MyFirstPage> {
  bool enabled = false;
  int timesClicked = 0;
  String msg1 = '';
  String msg2 = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('A2 - User Input'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the label and switch here
              //as children of the row.
              Text('Enable Buttons'),
              Switch(
                value: enabled,
                onChanged: (value) {
                  setState(() {
                    enabled = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //TODO: Build the two buttons here as children of the row.
              // For each button use a "Visibility Widget" and its child
              // will be an "ElevatedButton"
              Visibility(
                  visible: enabled,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20))),
                        onPressed: () {
                          setState(() {
                            timesClicked++;
                          });
                        },
                        child: Text(timesClicked == 0
                            ? 'Click Me'
                            : 'Clicked $timesClicked'),
                      ))),
              Visibility(
                  visible: enabled,
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(8),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(20))),
                        onPressed: () {
                          setState(() {
                            timesClicked = 0;
                          });
                        },
                        child: Text('Reset'),
                      ))),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  //TODO: Build the text form field here as the first
                  // child of the column.
                  // Include as the second child of the column
                  // a submit button that will show a
                  // snackbar with the "firstName" if validation
                  // is satisfied.
                  TextFormField(
                    controller: textEditingController,
                    maxLength: 10,
                    decoration: InputDecoration(
                      icon: Icon(Icons.hourglass_top),
                      helperText: 'min 1, max 10',
                      label: Text('first name'),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      suffixIcon: Icon(Icons.check_circle),
                    ),
                    validator: (value) {
                      return value!.length > 10
                          ? 'Must be less than 10 characters'
                          : value.isEmpty
                              ? 'Must be more than 1 character'
                              : null;
                    },
                    onSaved: (value) {
                      firstName = value;
                    },
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.only(
                                      top: 5, bottom: 5, left: 20, right: 20))),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              scaffoldMessengerKey.currentState?.showSnackBar(
                                SnackBar(
                                  duration: const Duration(seconds: 5),
                                  behavior: SnackBarBehavior.floating,
                                  content: Row(
                                    children: [
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Hey $firstName',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      TextButton(
                                          style: ButtonStyle(
                                              foregroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Color(0xFF442B2D))),
                                          onPressed: () => print('A message'),
                                          child: Text(
                                            'Click Me',
                                            style: TextStyle(fontSize: 15.0),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text('Submit'),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
