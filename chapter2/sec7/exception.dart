void doSomething() {
  throw MyException('エラーが発生しました');
}

class MyException {
  MyException(this.message);
  final String message;
}

// 例外処理の基本形
void List2_7_1() {
  try {
    doSomething();
  } catch (e) {
    print(e);
  }
}
