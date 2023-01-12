import 'package:flutter/material.dart';
import 'package:login_demo_mt/view/User%20sighnup%20Page/lists/signUpList.dart';
import 'package:provider/provider.dart';
import '../../../controller/provider.dart';

class TextName extends StatelessWidget {
  const TextName({
    Key? key,
    required this.userInformation,
    required this.widths,
    required this.heights,
  }) : super(key: key);
  final int userInformation;
  final double widths;
  final double heights;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderItem>(builder: (context, textProvi, child) {
      return Container(
        width: widths * 0.8,
        height: heights * 0.08,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            SizedBox(
              width: widths * 0.05,
            ),
            Text(
              neededUserInfo[userInformation],
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            SizedBox(
              width: widths * 0.05,
            ),
            SizedBox(
              width: widths * 0.5,
              child: Center(
                child: TextFormField(
                  controller: textProvi.loginName,
                  onChanged: (value) async {
                    textProvi.contState();
                    // print(sharePref.get('name'));
                  },
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
