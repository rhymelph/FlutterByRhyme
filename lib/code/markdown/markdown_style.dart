import 'package:flutter/material.dart';

enum TitleStyle { h1, h2, h3, h4, h5 }

enum CodeStyle {
  base,
  number,
  comment,
  todo,
  keyword,
  string,
  punctuation,
  classes,
  constant
}

enum TableStyle { title, content }



enum ContentStyle { bold, italic, code, normal, delete, link }

abstract class MarkDownStyle {
  const MarkDownStyle();

  TextStyle title(TitleStyle style);

  TextStyle code(String type, CodeStyle style);

  TextStyle table(TableStyle style);

  TextStyle quote();

  TextStyle content(ContentStyle style);

  TextStyle image();
}

class DefaultMarkDownStyle extends MarkDownStyle {
  const DefaultMarkDownStyle();

  @override
  TextStyle code(String type, CodeStyle style) {
    if (type == 'dart') {
      switch (style) {
        case CodeStyle.base:
          return const TextStyle(color: const Color(0xFF000000));
        case CodeStyle.number:
          return const TextStyle(color: const Color(0xFF1565C0));
        case CodeStyle.comment:
          return const TextStyle(color: const Color(0xFF9E9E9E));
        case CodeStyle.todo:
          return const TextStyle(
              color: const Color(0xFF0073BF), fontWeight: FontWeight.bold);
        case CodeStyle.keyword:
          return const TextStyle(color: const Color(0xFF9C27B0));
        case CodeStyle.string:
          return const TextStyle(color: const Color(0xFF43A047));
        case CodeStyle.punctuation:
          return const TextStyle(color: const Color(0xFF000000));
        case CodeStyle.classes:
          return const TextStyle(color: const Color(0xFF512DA8));
        case CodeStyle.constant:
          return const TextStyle(color: const Color(0xFF795548));
      }
    }
    return const TextStyle();
  }

  @override
  TextStyle content(ContentStyle style) {
    // TODO: implement content
    switch (style) {
      case ContentStyle.bold:
        return const TextStyle(fontWeight: FontWeight.bold);
      case ContentStyle.code:
        return const TextStyle(
            fontStyle: FontStyle.italic, color: Colors.deepPurpleAccent);
      case ContentStyle.delete:
        return const TextStyle(decoration: TextDecoration.lineThrough);
      case ContentStyle.italic:
        return const TextStyle(fontStyle: FontStyle.italic);
      case ContentStyle.link:
        return const TextStyle(
            decoration: TextDecoration.underline, color: Colors.blue);
      case ContentStyle.normal:
        return const TextStyle();
    }
    return const TextStyle();
  }

  _imageTextBG() {
    return Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey;
  }

  @override
  TextStyle image() {
    // TODO: implement image
    return TextStyle(
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.grey,
        background: _imageTextBG());
  }

  @override
  TextStyle quote() {
    return const TextStyle();
  }

  @override
  TextStyle table(TableStyle style) {
    switch (style) {
      case TableStyle.content:
        return const TextStyle();
      case TableStyle.title:
        return const TextStyle(fontWeight: FontWeight.bold);
    }
    return const TextStyle();
  }

  @override
  TextStyle title(TitleStyle style) {
    switch (style) {
      case TitleStyle.h1:
        return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
      case TitleStyle.h2:
        return const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
      case TitleStyle.h3:
        return const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
      case TitleStyle.h4:
        return const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
      case TitleStyle.h5:
        return const TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
    }
    return const TextStyle();
  }
}
