import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider.dart';
import '../lists/signUpList.dart';

class TextFormPass extends StatelessWidget {
  const TextFormPass({
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
              style: const TextStyle(fontSize: 16,color: Colors.white),
            ),
            SizedBox(
              width: widths * 0.05,
            ),
            SizedBox(
              width: widths * 0.5,
              child: Center(
                child: TextFormField(
                  controller: textProvi.passCont,
                  onChanged: (value) async {
                    textProvi.sharedPrefpassAdd();
                    textProvi.loadSavedPass();
                    textProvi.contState();
                    print(textProvi.passoword);
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
