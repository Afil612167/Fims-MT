import 'package:flutter/material.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/widgets/textFormEmail.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/widgets/textFormName.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/widgets/text_form_pass.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/widgets/text_form_phone.dart';
import 'package:provider/provider.dart';

import '../../controller/provider.dart';
import '../login_page/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
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
                'Sign up',
                style: TextStyle(
                    fontSize: heights * 0.06, fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: heights * 0.06,
              ),
              SizedBox(
                  height: heights * 0.6,
                  width: widths * 0.8,
                  // color: Colors.green,/
                  child: Column(
                    children: [
                      TextFormName(
                          userInformation: 0, widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormEmail(
                          userInformation: 1, widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormPass(
                          userInformation: 2, widths: widths, heights: heights),
                      SizedBox(
                        height: heights * 0.04,
                      ),
                      TextFormPhone(
                          userInformation: 3, widths: widths, heights: heights),
                      Padding(
                        padding: EdgeInsets.only(
                            left: widths * 0.5, top: heights * 0.03),
                        child: SizedBox(
                          height: heights * 0.05,
                          child: Consumer<ProviderItem>(
                              builder: (context, textpro, child) {
                            return ElevatedButton(
                              onPressed: () async {
                                print(textpro.email);
                                if (textpro.email.characters.length > 3 &&
                                    textpro.name.characters.length > 3 &&
                                    textpro.passoword.characters.length > 3 &&
                                    textpro.phone.characters.length > 3) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginPage(),
                                      ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black),
                              child: const Text('Sign up'),
                            );
                          }),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
