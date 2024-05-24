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

/// Streamの購読（Listen）をキャンセル、一時停止する方法~その1~
void List2_12_43() {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  final subscription = stream.listen((data) {
    print('data: ${data.length} bytes');
  });

  // 購読をキャンセル
  subscription.cancel();
}

/// Streamの購読（Listen）をキャンセル、一時停止する方法~その2~
void List2_12_44() async {
  final file = File('file.txt');
  final Stream<List<int>> stream = file.openRead();
  final subscription = stream.listen((data) {
    print('data: ${data.length} bytes');
  });

  // 一時停止
  await Future.delayed(const Duration(seconds: 1));
  subscription.pause();

  // 再開
  await Future.delayed(const Duration(seconds: 4));
  subscription.resume();

  // // 購読をキャンセル
  // await Future.delayed(const Duration(seconds: 1));
  // subscription.cancel();
}

void main() {
  // List2_12_41();
  // List2_12_42();
  // List2_12_43();
  List2_12_44();
}
