import 'package:flutter/cupertino.dart';
import 'package:panel_resume/core/widgets/mb_Scaffold.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MBScaffold("name", body: Center(
      child: Text("not Found"),
    ));
  }
}
