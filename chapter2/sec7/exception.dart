void doSomething() {
  throw MyException('エラーが発生しました'); // 例外をスローする
}

// MyExceptionがtoStringメソッドをオーバライドしていない場合
class MyException {
  MyException(this.message);
  final String message;
}

// MyExceptionがtoStringメソッドをオーバライドした場合
// class MyException {
//   MyException(this.message);
//   final String message;
//
//   @override
//   String toString() {
//     return 'MyException: $message';
//   }
// }

// 例外処理の基本形
// 実行結果（toStringをオーバーライドしてない時）: Instance of 'MyException'
// 実行結果（toStringをオーバーライドした時）: MyException: エラーが発生しました
void List2_7_1() {
  try {
    doSomething();
  } catch (e) {
    print(e);
  }
}

// 補足する例外オブジェクトを指定する時はonキーワードを使う
void List2_7_2() {
  try {
    doSomething();
  } on MyException {
    print('catch MyException');
  }
}
