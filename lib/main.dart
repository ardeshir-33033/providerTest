import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'switch.dart';



Map<String, bool> CheckBoxList = {
  'یک': false,
  'دو': false,
  'سه': false,
};




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:
      MultiProvider(
        providers: [
          ChangeNotifierProvider<Switch1>(create: (context) => Switch1(), child: MyHomePage()),
          ChangeNotifierProvider<Switch2>(create: (context) => Switch2(), child: MyHomePage()),
        ],
      )
      // ChangeNotifierProvider<Switch1>(
      //     create: (context) => Switch1(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {

  bool redON = false;

  @override
  Widget build(BuildContext context) {
    final SwitchButton = Provider.of<Switch1>(context, listen: false);
    final SwitchButton2 = Provider.of<Switch2>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          Text('data'),
          Consumer<Switch1>(
            builder: (context, SwitchButton, child) => CupertinoSwitch(
              value: SwitchButton.redo,
              onChanged: (value) => SwitchButton.SwitchOnChange(value),
            ),
          ),
          Consumer<Switch1>(
            builder: (context, SwitchButton, child) => Container(
              height: 100,
              width: 100,
              color: SwitchButton.redo ? Colors.red : Colors.green,
            ),
          ),
          Consumer<Switch2>(
            builder: (context, SwitchButton2, child) => CupertinoSwitch(
              value: SwitchButton2.redo,
              onChanged: (value) => SwitchButton2.SwitchOnChange(value),
            ),
          ),
          Consumer<Switch2>(
            builder: (context, SwitchButton2, child) => Container(
              height: 100,
              width: 100,
              color: SwitchButton2.redo ? Colors.red : Colors.green,
            ),
          ),
          Container(
            height: 200,
            width: 100,
            child: ListView(
              children: CheckBoxList.keys.map((String key) {
                return SizedBox(
                  height: 30,
                  child: CheckboxListTile(
                    dense: true,
                    activeColor: Color(0xFF8F111D),
                    title: Text(
                      key,
                      style: TextStyle(fontSize: 15.0),
                    ),
                    value: CheckBoxList[key],
                    onChanged: (bool value) {
                      CheckBoxList[key] = value;
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
