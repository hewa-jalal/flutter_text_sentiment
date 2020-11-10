import 'package:flutter/material.dart';
import 'package:sentiment_dart/sentiment_dart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> _sentimentMap;
  @override
  Widget build(BuildContext context) {
    final sentiment = Sentiment();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter a text to get it\'s sentiment',
              ),
              onChanged: (val) =>
                  setState(() => _sentimentMap = sentiment.analysis(val)),
            ),
          ),
          SizedBox(height: 20),
          _sentimentMap != null
              ? Text('Score: ${_sentimentMap['score'].toString()}')
              : Container(),
          _sentimentMap != null
              ? Text(
                  'Bad Words: ${_sentimentMap['badword'].toString().replaceAll('[', '').replaceAll(']', '')}')
              : Container(),
          _sentimentMap != null
              ? Text(
                  'Good Words: ${_sentimentMap['good words'].toString().replaceAll('[', '').replaceAll(']', '')}')
              : Container(),
        ],
      ),
    );
  }
}
