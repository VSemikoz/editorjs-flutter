import 'package:editorjs_flutter/src/model/EditorJSBlockFile.dart';

class EditorJSBlockData {
  final String text;
  final int level;
  final String style;
  final List<String> items;
  final EditorJSBlockFile? file;
  final String caption;
  final bool withBorder;
  // final bool stretched;
  final bool withBackground;

  EditorJSBlockData({
    required this.text,
    required this.level,
    required this.style,
    required this.items,
    required this.file,
    required this.caption,
    required this.withBorder,
    // required this.stretched,
    required this.withBackground,
  });

  factory EditorJSBlockData.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['items'] as List;
    List<String> itemsList = [];

    list.forEach((element) {
      itemsList.add(element);
    });

    return EditorJSBlockData(
        text: parsedJson['text'],
        level: parsedJson['level'],
        style: parsedJson['style'],
        items: itemsList,
        file: (parsedJson['file'] != null) ? EditorJSBlockFile.fromJson(parsedJson['file']) : null,
        caption: parsedJson['caption'],
        withBorder: parsedJson['withBorder'],
        withBackground: parsedJson['withBackground']);
  }
}
