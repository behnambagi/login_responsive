import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({Key? key,required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        child: child,
        elevation: 0.5,
        itemBuilder: (context) {
          return const[
            PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Avatar"),
                )),
            PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Gallery"),
                )),
            PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                )),
            PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text("Remove"),)),
          ];
        });
  }
}
