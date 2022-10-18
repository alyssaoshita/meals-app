import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/main_drawer.dart';

class FeedbackScreen extends StatefulWidget {
  static const routeName = '/suggestions';

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime date;
  final datetime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      resizeToAvoidBottomInset: false,
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Submit your feedback!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Enter Your Name',
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    validator: (String value) {
                      return (value != null && value.contains(''))
                          ? 'The _ character cannot be used here!'
                          : null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.feedback),
                      hintText: 'Give your feedback here!',
                      labelText: 'Feedback',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                    maxLines: 5,
                    minLines: 3,
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            child: const Text(
              'Submit',
              textAlign: TextAlign.center,
            ),
            onPressed: () {
              EdgeInsets.all(10);
              EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0);
              setState(() {
                date = new DateTime.now();
                String formattedDate =
                    DateFormat('MM/dd/yyyy hh:mm').format(date);
                datetime.text = '$date';
              });
              if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Thank you for the feedback!'),
                  ),
                );
              }
            },
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Your Last Submission Was Sent On:',
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 111.0),
            child: TextField(
              controller: datetime,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}