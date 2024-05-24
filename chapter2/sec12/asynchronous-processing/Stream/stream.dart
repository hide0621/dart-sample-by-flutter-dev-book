/// 非同期処理
/// Stream型について
///
/// 非同期に連続した値を扱う時のデータ型（ログストリームみたいな？）
///
/// 特徴：
/// -
/// -

import 'dart:io';

void List2_12_41() {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  stream.listen((data) {
    print('data: ${data.length} bytes');
  });
}

/// 上のコードをリファクタリングするとこうなる（コードの量が減り、読みやすくなる？）
Future<void> List2_12_42() async {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  await for (final data in stream) {
    print('data: ${data.length} bytes');
  }
}

void main() {
  // List2_12_41();
  List2_12_42();
}
