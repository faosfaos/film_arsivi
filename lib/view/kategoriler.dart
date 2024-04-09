import 'package:flutter/material.dart';

class Kategoriler extends StatefulWidget {
  const Kategoriler({Key? key}) : super(key: key);

  @override
  _KategorilerState createState() => _KategorilerState();
}

class _KategorilerState extends State<Kategoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _builadAppBar()
        //body: _buildBody(),
        );
  }

  AppBar _builadAppBar() {
    return AppBar(
      title: Text("Kategoriler"),
    );
  }

  _buildBody() {}
}
