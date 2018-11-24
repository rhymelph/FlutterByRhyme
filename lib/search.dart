import 'package:flutter/material.dart';
import 'pages.dart';

//class SearchPage extends StatefulWidget {
//  @override
//  _SearchPageState createState() => _SearchPageState();
//}
//
//class _SearchPageState extends State<SearchPage> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Search'),
//      ),
//    );
//  }
//}

const List<String> hotList=[
  'Row',
  'Column',
  'Image',
  'AppBar',
  'Icon',
  'MaterialApp',
  'ListView',
];

class SearchPage extends SearchDelegate<String>{

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      close(context, query);
    });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('热门搜索：'),
            Wrap(
              spacing: 10.0,
              children: hotList.map((s)=>InkWell(child: Chip(label: Text(s),),onTap: (){
                query=s;
              },)).toList(),
            ),
          ],
        ),
      );
    }
    Set<Page> pageSet=Set();
    RegExp regExp=RegExp("$query",caseSensitive: false);
    for(Page p in kAllPages){
      if(regExp.hasMatch(p.title)||regExp.hasMatch(p.subhead)){
        pageSet.add(p);
      }
    }
    List<Page> pageList=pageSet.toList();
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      Page p=pageList.toList()[index];
      return ListTile(
        title: Text(p.title),
        subtitle: Text(p.subhead),
        onTap: (){
          Navigator.of(context).pushNamed(p.routeName);
        },
      );
    },
    itemCount: pageList.length,);
  }

}