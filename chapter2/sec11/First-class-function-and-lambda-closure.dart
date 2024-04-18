/// 第１級関数と匿名関数
///
/// 関数オブジェクトの型は、「戻り値の型 Function(引数の型)」という形式で表現される。
///
/// 匿名関数の構文は、(引数) { 処理（関数の本体） } となる。

void List2_11_7() {
  // 引数を２倍にして返す関数
  int doubleValue(int value) {
    return value * 2;
  }

  // 関数doubleValueを変数fに代入 → 変数fはint型の引数を受け取り、int型の戻り値を返す関数オブジェクトとなる
  final int Function(int) f = doubleValue;

  final result = f(10);

  print(result); // 20
}

// 上記の関数を匿名関数で書いてみる
void List2_11_8() {
  final int Function(int) f = (x) {
    return x * 2;
  };

  final result = f(10);

  print(result); // 20
}

// クロージャーの例
void List2_11_9() {
  // 以下の関数は引数をキャプチャしたクロージャーを生成している
  Function multiple(int i) {
    // 以下は匿名関数とアロー関数を組み合わせた表現
    return (x) => x * i;
  }

  final f1 = multiple(3);
  final f2 = multiple(7);

  print(f1(2));
  // 6
  print(f2(6));
  // 42
}
