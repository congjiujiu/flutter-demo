import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import 'package:myapp/router/routes.dart';
import 'package:myapp/router/application.dart';

import './views/app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp()  {
    final router = new Router();

    Routes.configureRoutes(router);

    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'my app',
      home: new Scaffold(
        body: AppPage(),
      ),
      onGenerateRoute: Application.router.generator,
    );
  }
}