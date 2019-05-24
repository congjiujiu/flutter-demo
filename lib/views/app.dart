import 'package:flutter/material.dart';
import 'package:myapp/views/home.dart';
import 'package:myapp/views/profile.dart';

import 'package:myapp/router/application.dart';

class AppPage extends StatefulWidget {
  @override
  AppState createState() => AppState();
}

class AppState extends State<AppPage>
  with SingleTickerProviderStateMixin {
  TabController controller;
  String appBarTitle = tabData[0]['text'];
  static List tabData = [
    {'text': '首页', 'icon': new Icon(Icons.home)},
    {'text': '啥玩意儿', 'icon': new Icon(Icons.extension)},
    {'text': '我的', 'icon': new Icon(Icons.people)},
  ];

  List<Widget> myTabs = [];

  @override
  void initState() {
    super.initState();
    controller = TabController(initialIndex: 0, vsync: this, length: 3);

    for (int i = 0; i < tabData.length; i++) {
      myTabs.add(Tab(text: tabData[i]['text'], icon: tabData[i]['icon']));
    }

    controller.addListener(() {
      if (controller.indexIsChanging) {
        _onTabChange();
      }
    });

    Application.controller = controller;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      appBar: AppBar(title: Text('fuckable app')),
      body: TabBarView(controller: controller, children: <Widget>[
        HomePage(),
        ProfilePage(),
        ProfilePage(),
      ]),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: SafeArea(
          child: Container(
            height: 65.0,
            child: TabBar(
              controller: controller,
              indicatorColor: Theme.of(ctx).primaryColor,
              labelColor: Theme.of(ctx).primaryColor,
              tabs: myTabs,
            ),
          ),
        ),
      ),
    );
  }

  _onTabChange() {
    if (mounted) {
      setState(() {
        appBarTitle = tabData[controller.index]['text'];
      });
    }
  }
}