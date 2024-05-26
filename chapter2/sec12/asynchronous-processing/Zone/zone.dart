import 'dart:async';

/// 非同期処理
/// Zoneについて

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
