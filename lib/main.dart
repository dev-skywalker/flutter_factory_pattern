import 'package:flutter/material.dart';
import 'package:flutter_learn/dialog/android_alert_dialog.dart';
import 'package:flutter_learn/custom_dialog.dart';
import 'package:flutter_learn/dialog_selection.dart';
import 'package:flutter_learn/dialog/ios_alert_dialog.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<CustomDialog> customDialogList = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int index) {
    setState(() {
      _selectedDialogIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: SingleChildScrollView(
          //padding: const EdgeInsets.symmetric(horizontal: paddingL),
          child: Column(
            children: <Widget>[
              DialogSelection(
                customDialogList: customDialogList,
                selectedIndex: _selectedDialogIndex,
                onChanged: _setSelectedDialogIndex,
              ),
              RaisedButton(
                child: Text('Show Dialog'),
                onPressed: () => _showCustomDialog(context),
              ),
            ],
          ),
        ),
      )
    );
  }
}
