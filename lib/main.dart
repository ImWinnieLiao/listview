import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('ListView範例'),
    );

    final textWrapper = _TextWrapper(GlobalKey<_TextWrapperState>());

    const items = <String>['汽車', '鬧鈴', '上傳雲端','博物館','禮物盒','骰子','wifi','抓寶可夢'];
    final List<IconData> icons = [Icons.airport_shuttle,Icons.alarm,Icons.backup,Icons.account_balance,
      Icons.card_giftcard,Icons.casino,Icons.wifi,Icons.catching_pokemon];

    var listView = ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) =>
      Card(
        child:ListTile(title: Text(items[index],style: TextStyle(fontSize: 20),),
          onTap: () => textWrapper.setText('點選'+items[index]),
          leading: Container(
            child: Icon(icons[index]),
            padding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),),
          subtitle: Text('項目說明',style: TextStyle(fontSize: 16),),),
      ),

      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );

    final widget = Container(
      child: Column(
        children:  [
          textWrapper,
          Expanded(child: listView,),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 10,),
    );

    final appHomePage = Scaffold(
      appBar: appBar,
      body: widget,
    );

    return appHomePage;
  }
}

class _TextWrapper extends StatefulWidget {
  final GlobalKey<_TextWrapperState> _key;

  _TextWrapper(this._key): super (key: _key);

  State<StatefulWidget> createState() => _TextWrapperState();

  setText(String string) {
    _key.currentState?.setText(string);
  }
}

class _TextWrapperState extends State<_TextWrapper> {
  String _str = '';

  Widget build(BuildContext context) {
    var widget = Text(
      _str,
      style:  TextStyle(fontSize: 20),
    );

    return widget;
  }

  setText(String string) {
    setState(() {
      _str = string;
    });
  }
}