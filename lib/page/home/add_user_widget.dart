import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertestapi/data/bloc/app_bloc.dart';
import 'dart:developer' as developer;

import 'package:fluttertestapi/widget/form_input_widget.dart';
import 'package:fluttertestapi/widget/show_dialog_loading.dart';
import 'package:provider/provider.dart';

class AddUserWidget extends StatefulWidget {
  static const ROUTE_NAME = 'AddUserWidget';

  @override
  _AddUserWidgetState createState() => _AddUserWidgetState();
}

class _AddUserWidgetState extends State<AddUserWidget> {
  static const TAG = 'AddUserWidget';

  AppBloc _appBloc;

  GlobalKey<FormState> _keyForm = GlobalKey();

  String _userName;

  String _job;

  @override
  void initState() {
    super.initState();
    _appBloc = Provider.of(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add User'),
        centerTitle: true,
      ),
      body: Form(
        key: _keyForm,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'User Name:',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.black87),
                  ),
                ),
                FormInputWidget(
                  'User Name',
                  onSaved: (value) {
                    _userName = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Not be empty';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Job :',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(color: Colors.black87),
                  ),
                ),
                FormInputWidget(
                  'Job',
                  onSaved: (value) {
                    _job = value;
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  onPressed: _onTapAddUser,
                  color: Colors.blue,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Add User',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _onTapAddUser() {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      showDialogProgressLoading(
              context, _appBloc.createUser(RequestCreateUser(_userName, _job)))
          .then((value) {
        if (value.isValue && value.asValue.isValue) {
          _alertDialog().then((value) {
            Navigator.of(context).pop();
          });
        }
      });
    }
  }

  Future<void> _alertDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: new Text("You created user successfully"),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
