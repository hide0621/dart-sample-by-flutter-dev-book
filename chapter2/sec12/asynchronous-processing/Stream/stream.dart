/// 非同期処理
/// Stream型について
///
/// 非同期に連続した値を扱う時のデータ型（ログストリームみたいな？）
///
/// どことなくGo言語のchannelに似ているような...
///
/// 特徴：
/// -
/// -

import 'dart:async';
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

/// streamには購読をキャンセルしない限り終了しない特性を持ったものもある
/// 例えば、以下のStream.periodic()は、指定した間隔で値を生成するStreamを生成する
/// このStreamは、購読をキャンセルしない限り終了しないので、
/// このような状況にあるStreamで async - await for を用いると以降の処理が実行されないので注意！
Future<void> List2_12_48() async {
  await for (final count
      in Stream.periodic(const Duration(seconds: 1), (i) => i)) {
    print(count);
  }

  /// このコードは実行されない
  print('-----');
  print('Done');
}

/// 上記のような関数で、特定の条件を満たしたらstreamを終了させる方法
/// Stream.takeメソッドを使用してストリームから特定の数のイベントを取得し、それ以降のイベントを無視させる
Future<void> List2_12_49() async {
  await for (final count
      in Stream.periodic(const Duration(seconds: 1), (i) => i).take(6)) {
    print(count);
  }

  print('-----');
  print('Done');
}

/// Stream型のエラーハンドリング
Stream<String> language2() async* {
  await Future.delayed(const Duration(seconds: 1));
  yield 'Dart';
  await Future.delayed(const Duration(seconds: 1));
  throw Exception('Some Error');
}

void List2_12_50() {
  language2().listen((language) {
    print(language);
  }, onError: (e) {
    print(e);
  });
}

/// 上記のコードをtry-catchでリファクタリングするとこうなる
Future<void> List2_12_51() async {
  try {
    await for (final language in language2()) {
      print(language);
    }
  } catch (e) {
    print(e);
  }
}

/// StreamControllerを使用して、Streamを生成する方法
class Counter {
  int _count = 0;
  StreamController<int> _controller = StreamController<int>();

  Stream<int> get stream => _controller.stream;

  void increment() {
    _count++;
    _controller.add(_count);
  }
}

Future<void> List2_12_52() async {
  final counter = Counter();

  counter.increment();
  counter.increment();

  counter.stream.listen((count) {
    print(count);
  });

  counter.increment();
}

void main() {
  // List2_12_41();
  // List2_12_42();
  // List2_12_43();
  // List2_12_44();
  // List2_12_45();
  // List2_12_46();
  // List2_12_47();
  // List2_12_48();
  // List2_12_49();
  // List2_12_50();
  // List2_12_51();
  List2_12_52();
}
