import 'package:editorjs_flutter/src/model/EditorJSBlockFile.dart';

class EditorJSBlockData {
  final String? text;
  final int? level;
  final String? style;
  final List<String>? items;
  final EditorJSBlockFile? file;
  final String? caption;
  final bool? withBorder;
  final bool? stretched;
  final bool? withBackground;

  EditorJSBlockData({
    this.text,
    this.level,
    this.style,
    required this.items,
    this.file,
    this.caption,
    this.withBorder,
    this.stretched,
    this.withBackground,
  });

  factory EditorJSBlockData.fromJson(Map<String, dynamic> parsedJson) {
    return EditorJSBlockData(
        text: parsedJson['text'],
        level: parsedJson['level'],
        style: parsedJson['style'],
        items: (parsedJson['items'] as List?)?.map((e) => e.toString()).toList(),
        file: (parsedJson['file'] != null) ? EditorJSBlockFile.fromJson(parsedJson['file']) : null,
        caption: parsedJson['caption'],
        withBorder: parsedJson['withBorder'],
        withBackground: parsedJson['withBackground']);
  }
}
