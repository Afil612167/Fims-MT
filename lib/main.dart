import 'package:flutter/material.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/sighnup_page.dart';
import 'package:login_demo_mt/view/api%20connection/api_connection_page.dart';
import 'package:provider/provider.dart';

import 'controller/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ProviderItem>(
    create: (context) => ProviderItem(),
    child: MaterialApp(
      home: SignUpPage(),
    ),
  ));
}
