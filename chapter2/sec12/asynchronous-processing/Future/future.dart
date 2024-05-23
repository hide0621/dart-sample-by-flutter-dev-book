/// 非同期処理
/// Future型について

import 'dart:io';

void List2_12_36() {
  Future<String> content = File('file.txt').readAsString();
  content.then((content) => print(content));
}

void main() {
  List2_12_36();
}
