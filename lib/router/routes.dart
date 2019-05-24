import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import './route_handlers.dart';

class Routes {
  static String root = "/";
  static String profile = "/profile";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
      handlerFunc: (BuildContext ctx, Map<String, List<String>> params) {
        print('ROUTE WAS NOT FOUND !!!');
      }
    );

    router.define(root, handler: homeHandler);
    router.define(profile, handler: profileHandler);
  }
}