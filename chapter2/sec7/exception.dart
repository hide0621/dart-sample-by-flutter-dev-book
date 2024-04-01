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
    print('catch MyException'); // catch MyException
  }
}

// 例外オブジェクトを取得する場合はcatchブロックの引数に指定する
// catchの第一引数は例外オブジェクト、第二引数はスタックトレース
// スタックトレースには、エラーが発生したメソッドや行番号、それに至るまでのメソッド呼び出しの連鎖（呼び出し元のメソッド、その呼び出し元のメソッド、と遡る）が記録されています。
void List2_7_3() {
  try {
    doSomething();
  } catch (e, st) {
    print('catch $e'); // catch Instance of 'MyException'
    print(
        'stack trace: $st'); // stack trace: #0      doSomething (file:///Users/~/例外発生場所のパス)
  }
}
