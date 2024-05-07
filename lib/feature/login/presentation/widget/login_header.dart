import 'package:flutter/material.dart';

import '../../../../core/material/color_material.dart';
import '../../../../core/material/text_style_material.dart';

class LoginHeader {
  PreferredSize header(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(280),
      child: AppBar(
        backgroundColor: colorWhite,
        elevation: 0.0,
        flexibleSpace: Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 50, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "QN ", style: materialTextStyle.largeTextStyleRed),
                TextSpan(
                  text: "Presence",
                  style: materialTextStyle.largeTextStylePrimary,
                )
              ])),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Divider(
                    color: colorPrimary,
                  )),
              Text(
                "Silahkan masukan akun anda",
                style: materialTextStyle.normalTextStylePrimary,
              ),
              Text(
                "Terimakasih",
                style: materialTextStyle.normalTextStylePrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
