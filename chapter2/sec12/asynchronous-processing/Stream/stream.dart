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

/// Stream型を生成する関数
Stream<String> languages() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield 'Dart';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Kotlin';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Swift';
  await Future.delayed(const Duration(seconds: 1));
  yield* Stream.fromIterable(['JavaScript', 'C++', 'Go']);
}

/// 上記関数の実行方法
void List2_12_45() {
  languages().listen((language) {
    print(language);
  });
}

/// streamの終了時に処理を実行する方法
void List2_12_46() async {
  languages().listen((language) {
    print(language);
  }, onDone: () {
    print('-----');
    print('Done');
  });
}

/// 上記関数をリファクタリングするとこうなる（こっちの方が可読性が高そう）
Future<void> List2_12_47() async {
  await for (final language in languages()) {
    print(language);
  }
  print('-----');
  print('Done');
}

void main() {
  // List2_12_41();
  // List2_12_42();
  // List2_12_43();
  // List2_12_44();
  // List2_12_45();
  // List2_12_46();
  List2_12_47();
}
