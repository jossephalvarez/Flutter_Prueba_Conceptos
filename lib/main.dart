import 'package:flutter/cupertino.dart';
import 'package:app_poc/ui/pages/result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoApp(
        theme: CupertinoThemeData(primaryColor: CupertinoColors.systemIndigo),
        title: 'Cam APP',
        home: ResultPage());
  }
}


