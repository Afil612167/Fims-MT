import 'package:flutter/material.dart';
import 'package:login_demo_mt/view/company%20info%20page/company_info_page.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Drawer(
      child: Consumer<ProviderItem>(builder: (context, detailsProvider, _) {
        return ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
                width: width * 0.1,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CompanyInfoPage(),
                        ));
                  },
                  child: Text(
                    'Company Info',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                )),
          ],
        );
      }),
    );
  }
}


