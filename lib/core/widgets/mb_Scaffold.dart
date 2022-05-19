import 'package:flutter/material.dart';

class MBScaffold extends StatelessWidget {
  final String name;
  final Widget body;
  final AppBar? appBar;
  final Drawer? drawer;
  final bool? titleCenter;
  final Widget? bottomNavigationBar;
  final Widget? floatButton;

  const MBScaffold(this.name,
      {Key? key, required this.body,
      this.appBar, this.titleCenter, this.drawer,
      this.bottomNavigationBar,
      this.floatButton,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: drawer,
        appBar: appBar ??
            AppBar(
              title: Text(name),
              centerTitle: titleCenter,
            ),
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatButton,
        body: body,
      ),
    );
  }
}
