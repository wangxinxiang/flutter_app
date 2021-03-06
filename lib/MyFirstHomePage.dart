import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class MyFirstHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MyFirstRandomWordState();
  }
}

//.......................练习.............................................
class MyFirstRandomWordState extends State<MyFirstHomePage> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _saved = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("la la la la"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    final tiles = _saved.map(
          (pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      },
    );

    final divided = ListTile.divideTiles(
      context: context,
      tiles: tiles,
    ).toList();

    Navigator.push(context,
        PageRouteBuilder(
            pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
              return FadeTransition(opacity: animation,
                child: Scaffold(
                  appBar: new AppBar(
                    title: new Text('Saved Suggestions'),
                  ),
                  body: new ListView(children: divided),
                )
              );
            },
        )
    );
//    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
//      return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('Saved Suggestions'),
//        ),
//        body: new ListView(children: divided),
//      );
//    }));
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
          alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: alreadySaved ? Colors.red : null,
        ),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        });
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

}
