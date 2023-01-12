import 'package:flutter/material.dart';

class CompanyInfo extends StatelessWidget {
  const CompanyInfo(
      {Key? key,
      this.height,
      required this.title,
      required this.catogory})
      : super(key: key);

  final double? height;
  final String title;
  final String catogory;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text.rich(TextSpan(
            text: '\t' + title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            children: <TextSpan>[
              TextSpan(
                  text: '\nGeeksynergy Technologies Pvt Ltd:- ' + catogory,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300))
            ])),
      ),
    );
  }
}