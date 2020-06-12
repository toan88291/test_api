import 'package:api_reqres/models/request/user/request_create_user.dart';
import 'package:api_reqres/models/request/user/request_update_user.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:fluttertestapi/data/bloc/app_bloc.dart';
import 'package:fluttertestapi/page/page.dart';
import 'package:provider/provider.dart';

import 'home/home_page.dart';

class MainPage extends StatefulWidget {
  static const ROUTE_NAME = 'MainPage';

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const TAG = 'MainPage';

  PageController _pageController = PageController();

  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Api'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HomePage(),

          Container(
            color: Colors.white,
          )
        ],
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return AddUserWidget();
            },
          ));
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Settings'),
          ),
        ],
        onTap: (index) {
          _currentPageIndex = index;
          _pageController.jumpToPage(_currentPageIndex);
        },
        currentIndex: _currentPageIndex,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
