import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:login_demo_mt/view/company%20info%20page/widget/company_info.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    List title = ['Company:', 'Address', 'phone', 'email'];
    List companyDetails = [
      'Geeksynergy Technologies Pvt Ltd',
      'Sanjayanagar, Bengaluru-56',
      'XXXXXXXXX09',
      'XXXXXXXXX09'
    ];
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount:4 ,
        itemBuilder: (context, index) =>
            CompanyInfo(title: title[index], catogory: companyDetails[index]),
      ),
    );
  }
}
