import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

class MailingList extends StatefulWidget {
  @override
  _MailingListState createState() => _MailingListState();
}

class _MailingListState extends State<MailingList> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  String email;
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool isAdded = false;

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurred!',
        ),
        content: Text(
          message,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Okay',
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> _verifyEmail(String emailVerify) async {
    if (!_formKey.currentState.validate()) {
      // Invalid email address or address already added!
      return;
    }

    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });

    try {} on HttpException catch (error) {} catch (error) {
      const errorMessage =
          'Could not add to mailing list. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<http.Response> _getContacts() {
    final _getContactsUrl = 'https://api.sendgrid.com/v3/marketing/contacts';

    return http.get(
      _getContactsUrl,
      headers: {
        HttpHeaders.authorizationHeader:
            'Bearer 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',
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.hostHeader: 'api.sendgrid.com',
      },
    );
  }

  Future<void> _sendGridFunction(String email) async {
    final String listId = '8807ae38-90d3-4cfd-9bb3-0a3eec58a031';
    final String listName = 'jeromeagustin-flutter-resume';

    final url = 'https://api.sendgrid.com/v3/marketing/lists?page_size=100';

    // final url = 'https://api.sendgrid.com/v3/resource';
    // Get Contact list
    final listResponse = await _getContacts();
    final list = json.decode(listResponse.body);
    // Get Recipients in List
    // print(list);

    // Add Single Recipient
    // POST https://api.sendgrid.com/v3/contactdb/lists/{list_id}/recipients/{recipient_id} HTTP/1.1
    var response = await http.post({});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            'Want to stay updated with Jerome?',
          ),
          Container(
            height: 40,
            child: Form(
              key: _formKey,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 280,
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Email', border: OutlineInputBorder()),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Invalid email!';
                        }
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    RaisedButton(
                      child: Text(
                        'Subscribe',
                      ),
                      onPressed: () {
                        setState(() {
                          // _verifyEmail(email);
                          _sendGridFunction('jerome@jerome.com');
                          // if(email != null) isAdded = true;
                        });
                      },
                    ),
                ],
              ),
            ),
          ),
          if (isAdded)
            Text(
              'Added $email to Mailing List',
            ),
        ],
      ),
    );
  }
}
