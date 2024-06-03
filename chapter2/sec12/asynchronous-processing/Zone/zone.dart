import 'dart:async';

/// 非同期処理
/// Zoneについて
///
/// 特徴： 非同期処理のコンテキストを管理している、その機能の1つに非同期処理で補足されなかった例外のハンドリング機能がある
///
/// 下記のrunZonedGuarded関数の第一引数で受け取った処理を自身のZoneで実行し
/// 例外が発生した場合は第二引数で受け取った関数を呼び出す
///
/// ただし、FlutterのエラーハンドリングはZoneではなく `PlatformDispatcher` を使うことが一般的
///
/// ただその一方で、実際は全てのDartコードはZoneで実行されていて、main関数は暗黙的にdefault Zoneで実行されている

/// Zoneを使わない場合
Future<String> fetchUserName() {
  var str =
      Future.delayed(const Duration(seconds: 1), () => throw 'User not found');
  return str;
}

/// これは例外を補足できるが...
void List2_12_55() {
  fetchUserName().then((name) {
    print('User name is $name');
  }).catchError((e) {
    print(e); // User not found
  });
}

/// こっちは出来ない...
void List2_12_56() {
  fetchUserName().then((name) {
    print('User name is $name');
  });
}

/// Zoneを使うと...
void List2_12_57() {
  runZonedGuarded(() => fetchUserName().then((data) => print(data)),
      (error, stackTrace) {
    print('Caught error: $error');
  });
}

void main() {
  // List2_12_55();
  // List2_12_56();
  List2_12_57();
}
