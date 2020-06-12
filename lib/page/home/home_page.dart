import 'package:api_reqres/models/response/user/detail_user_response.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:fluttertestapi/data/bloc/app_bloc.dart';
import 'package:fluttertestapi/widget/show_dialog_loading.dart';
import 'package:provider/provider.dart';

import 'update_user_widget.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TAG = 'HomePage';

  AppBloc _appBloc;

  List<DetailUserResponse> data;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _appBloc = Provider.of(context, listen: false);
    _appBloc.getListUser(2).then((value) {
      if (value.asValue.isValue && value.isValue) {
        setState(() {
          data = value.asValue.value.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (data == null) {
      return Center(child: CircularProgressIndicator());
    } else if (data.isEmpty) {
      return Center(
        child: Text('Data isEmpty'),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8),
        child: ListView.separated(
          itemCount: data?.length ?? 0,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return UpdateUserWidget(data[index]);
                }));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  data[index]?.avatar,
                ),
              ),
              title: Text(
                '${data[index]?.first_name} ${data[index]?.last_name}',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              subtitle: Text(
                data[index]?.email,
                style: Theme.of(context).textTheme.subtitle2,
              ),
              trailing: IconButton(
                onPressed: _deleteUser,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return Divider(height: 8);
          },
        ),
      );
    }
  }

  _deleteUser() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: new Text("Do you want to delete user?"),
            actions: <Widget>[
              FlatButton(
                child: new Text("YES"),
                onPressed: _onTapDeleteUser,
              ),
              FlatButton(
                child: new Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  _onTapDeleteUser() {
    showDialogProgressLoading(context, _appBloc.deleteUser('2')).then((value) {
      Navigator.of(context).pop();
    });
  }
}
