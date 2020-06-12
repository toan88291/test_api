import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:api_reqres/models/response/user/detail_user_response.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:fluttertestapi/data/bloc/app_bloc.dart';
import 'package:fluttertestapi/widget/show_dialog_loading.dart';
import 'package:fluttertestapi/widget/widget.dart';
import 'package:provider/provider.dart';

class UpdateUserWidget extends StatefulWidget {
  final DetailUserResponse dataUser;

  UpdateUserWidget(this.dataUser);

  static const ROUTE_NAME = 'UpdateUserWidget';

  @override
  _UpdateUserWidgetState createState() => _UpdateUserWidgetState();
}

class _UpdateUserWidgetState extends State<UpdateUserWidget> {
  static const TAG = 'UpdateUserWidget';

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
        title: Text('Update User'),
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
                  initText:
                      widget.dataUser.first_name + widget.dataUser.last_name,
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
                  initText: 'Developer',
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
                  onPressed: _onTapUpdateUser,
                  color: Colors.blue,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Update User',
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

  _onTapUpdateUser() {
    if (_keyForm.currentState.validate()) {
      _keyForm.currentState.save();
      showDialogProgressLoading(context,
              _appBloc.updateUser(RequestUpdateUser(_userName, _job), '2'))
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
            content: new Text("Update successfully"),
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
