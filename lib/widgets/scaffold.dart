import 'package:flutter/material.dart';
import 'package:tesla_app/constants/color.dart';

class KScaffold extends StatelessWidget {
  final Widget? body;

  const KScaffold({Key? key, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(width: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [scaffoldBg1, scaffoldBg2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          /*tileMode: TileMode.clamp*/
        )),
        child: body,
      ),
    );
  }
}
