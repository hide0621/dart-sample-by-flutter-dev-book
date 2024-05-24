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

void main() {
  List2_12_41();
}
