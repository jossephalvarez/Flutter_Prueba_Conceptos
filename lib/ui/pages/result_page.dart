import 'package:flutter/cupertino.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Result'),
        leading: GestureDetector(
          onTap: () {
            print('ON TAP');
          },
          child: Icon(CupertinoIcons.back),
        ),
      ),
      child: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  Widget imageContainer() {
    return Container(
        height: 300,
        width: 300,
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(16.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.HYbn2i5aFs1U2kPenEdUqgHaEK%26pid%3DApi&f=1"),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[imageContainer()],
      ),
    );
  }
}
