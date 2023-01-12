import 'package:flutter/material.dart';
import 'package:login_demo_mt/view/api%20connection/api_connection_page.dart';
import 'package:login_demo_mt/view/login_page/widgets/textName.dart';
import 'package:login_demo_mt/view/login_page/widgets/text_pass.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../User sighnup Page/sighnup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProviderItem>().loginCheck = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Consumer<ProviderItem>(builder: (context, textProvider, _) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: heights * 1,
          width: widths * 1,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [Colors.purple, Color.fromARGB(255, 48, 149, 231)])),
          child: Column(
            children: [
              SizedBox(
                height: heights * 0.18,
              ),
              Center(
                  child: Text(
                'Login',
                style: TextStyle(
                    fontSize: heights * 0.06, fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: heights * 0.06,
              ),
              SizedBox(
                  height: heights * 0.6,
                  width: widths * 0.8,
                  child: Column(
                    children: [
                      TextName(
                          userInformation: 0, widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextPass(
                          userInformation: 2, widths: widths, heights: heights),
                      Container(
                        color: Colors.blue,
                        height: heights * 0.04,
                        width: 100,
                        child: textProvider.loginCheck
                            ? Center(
                                child: Text(
                                  'invalid credential',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                            : SizedBox(),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            if (textProvider.loginName.text ==
                                    textProvider.name &&
                                textProvider.loginPass.text ==
                                    textProvider.passoword) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ApiPage(),
                                  ));
                            } else {
                              textProvider.loginCheck = true;
                              print('hlo');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black),
                          child: Text('Login'))
                    ],
                  ))
            ],
          ),
        ),
      );
    }));
  }
}
