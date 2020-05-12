import 'package:flutter/material.dart' hide Page;
import 'pages.dart';

const List<String> hotList = [
  'Row',
  'Column',
  'Image',
  'AppBar',
  'Icon',
  'MaterialApp',
  'ListView',
];

class SearchPage extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    if (query.isEmpty) {
      return [
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showResults(context);
            }),
      ];
    } else {
      return [
        IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              query = '';
            }),
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showResults(context);
            }),
      ];
    }
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, query);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty || query == ' ' || query == '.' || query == '?') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('热门搜索：'),
            Wrap(
              spacing: 10.0,
              children: hotList
                  .map((s) => InkWell(
                        child: Chip(
                          label: Text(s),
                        ),
                        onTap: () {
                          query = s;
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    }
    Set<Page> pageSet = Set();
    RegExp regExp = RegExp("$query", caseSensitive: false);
    for (Page p in kAllPages) {
      if (regExp.hasMatch(p.title)) {
        pageSet.add(p);
      }
    }
    List<Page> pageList = pageSet.toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Page p = pageList[index];
        return ListTile(
          title: buildSearchText(
              Theme.of(context).textTheme.title, p.title, query),
          subtitle: buildSearchText(
              Theme.of(context).textTheme.subtitle, p.subhead, query),
          isThreeLine: true,
          onTap: () {
            close(context, p.routeName);
          },
        );
      },
      itemCount: pageList.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty || query == ' ' || query == '.' || query == '?') {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('热门搜索：'),
            Wrap(
              spacing: 10.0,
              children: hotList
                  .map((s) => InkWell(
                        child: Chip(
                          label: Text(s),
                        ),
                        onTap: () {
                          query = s;
                          showSuggestions(context);
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      );
    }
    Set<Page> pageSet = Set();
    RegExp regExp = RegExp("$query", caseSensitive: false);
    for (Page p in kAllPages) {
      if (regExp.hasMatch(p.title)) {
        pageSet.add(p);
      }
    }
    List<Page> pageList = pageSet.toList();
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Page p = pageList[index];
        return ListTile(
          title: Text(p.title),
          onTap: () {
            query = p.title;
            showResults(context);
          },
        );
      },
      itemCount: pageList.length,
    );
  }

  Widget buildSearchText(TextStyle style, String content, String queryContent) {
    List<TextSpan> textSpan = [];

    List<int> start = [];
    List<int> end = [];

    queryContent = escapeExprSpecialWord(queryContent);

    RegExp regExp = RegExp(queryContent, caseSensitive: false);

    if (regExp.hasMatch(content) && queryContent.isNotEmpty) {
      Iterable<Match> m = regExp.allMatches(content);
      for (Match item in m) {
        start.add(item.start);
        end.add(item.end);
      }
    }
    if (start.length == 0) {
      return Text(
        content,
        style: style,
      );
    }

    for (int i = 0; i < start.length; i++) {
      if (i == 0) {
        textSpan.add(
          TextSpan(
            text: content.substring(0, start[i]),
            style: style,
          ),
        );
      }
      if (i > 0) {
        textSpan.add(
          TextSpan(
            text: content.substring(end[i - 1], start[i]),
            style: style,
          ),
        );
      }
      textSpan.add(TextSpan(
        text: content.substring(start[i], end[i]),
        style: style.copyWith(color: Colors.red),
      ));
      if (i == start.length - 1) {
        textSpan.add(TextSpan(
          text: content.substring(end[i]),
          style: style,
        ));
      }
    }
    return RichText(
        text: TextSpan(
      children: textSpan,
    ));
  }

  ////转义正则特殊字符 （$()*+.[]?\^{},|）
  static String escapeExprSpecialWord(String keyword) {
    if (keyword.isNotEmpty) {
      List<String> fbsArr = [
        "\\",
        "\$",
        "(",
        ")",
        "*",
        "+",
        ".",
        "[",
        "]",
        "?",
        "^",
        "{",
        "}",
        "|"
      ];
      for (String key in fbsArr) {
        if (keyword.contains(key)) {
          keyword = keyword.replaceAll(key, "\\" + key);
        }
      }
    }
    return keyword;
  }
}
