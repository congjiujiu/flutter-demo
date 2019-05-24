import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:myapp/views/home.dart';
import 'package:myapp/views/profile.dart';

final homeHandler = new Handler(
  handlerFunc: (BuildContext ctx, Map<String, List<String>> params) {
    return new HomePage();
  }
);

final profileHandler = new Handler(
  handlerFunc: (BuildContext ctx, Map<String, List<String>> params) {
    return new ProfilePage();
  }
);