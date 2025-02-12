import 'package:editorjs_flutter/src/model/EditorJSBlockData.dart';

class EditorJSBlock {
  final String? type;
  final EditorJSBlockData data;

  EditorJSBlock({required this.type, required this.data});

  factory EditorJSBlock.fromJson(Map<String, dynamic> parsedJson) {
    return EditorJSBlock(data: EditorJSBlockData.fromJson(parsedJson['data']), type: parsedJson['type']);
  }
}
