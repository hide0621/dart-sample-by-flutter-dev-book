/// 非同期処理
/// Future型について
///
/// 特徴：
/// - awaitキーワードはasync関数内でのみ使用可能
/// - async関数の戻り値は暗黙的にFutureクラスでラップされる

import 'dart:io';

void List2_12_36() {
  Future<String> content = File('file.txt').readAsString();
  content.then((content) => print(content));
}

/// 上のコードをリファクタリングするとこうなる（コードの量が減り、読みやすくなる？）
Future<void> List2_12_37() async {
  String content = await File('file.txt').readAsString();
  print(content);
}

void main() {
  // List2_12_36();
  List2_12_37();
}
