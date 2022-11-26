import 'package:flutter/material.dart';
import 'package:tesla_app/constants/color.dart';

class KScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final List<Widget>? persistentFooterButtons;
  final Widget? drawer;
  final void Function(bool)? onDrawerChanged;
  final Widget? endDrawer;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool? extendBodyBehindAppBar;
  final bool? resizeToAvoidBottomInset;
  final bool? extendBody;

  const KScaffold(
      {Key? key,
      this.appBar,
      this.backgroundColor,
      this.floatingActionButton,
      this.body,
      this.extendBody,
      this.bottomNavigationBar,
      this.onDrawerChanged,
      this.extendBodyBehindAppBar,
      this.persistentFooterButtons,
      this.drawer,
      this.resizeToAvoidBottomInset,
      this.endDrawer,
      this.bottomSheet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
      appBar: appBar,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      floatingActionButton: floatingActionButton,
      extendBody: extendBody ?? false,
      bottomNavigationBar: bottomNavigationBar,
      bottomSheet: bottomSheet,
      drawer: drawer,
      persistentFooterButtons: persistentFooterButtons,
      endDrawer: endDrawer,
      onDrawerChanged: onDrawerChanged,
      body: Container(
        width: double.maxFinite,
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
