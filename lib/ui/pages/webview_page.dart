import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebviewPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text('WebView'),
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
                print('se presiono el boton');
              },
              child: Icon(CupertinoIcons.back),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 68),
              Expanded(
                  child: WebView(
                initialUrl: 'https://flutter.dev',
              )),
            ],
          ),
        ),
      ],
    );
  }
}
