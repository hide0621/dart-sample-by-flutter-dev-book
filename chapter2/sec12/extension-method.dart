/// 拡張メソッド
///
/// 拡張メソッドはメソッドのラップ、カスタムと同じものと思われる
///
/// extension <拡張名> on <拡張対象の型>
/// <拡張対象の型>とは紐づくオブジェクト自身、型自身を指しているものと思われ、Go言語に似ている
/// <拡張名>は識別子のようなものと思われるが、拡張メソッドを呼び出す際には使用されず、同じ型に紐づく拡張名は同一のものと見なされるようだ...
/// ジェネリクスの型パラメータは双方一致だと思われる
// extension SwapList<T> on List<T> {
//   // 引数のインデックスの要素を入れ替える拡張メソッド
//   void swap(int index1, int index2) {
//     // thisキーワードは拡張対象の型を指す（紐づくオブジェクト自身）
//     final tmp = this[index1];
//     this[index1] = this[index2];
//     this[index2] = tmp;
//   }
// }

// void List2_12_17() {
//   final list = [1, 2, 3];
//   list.swap(0, 2);
//   print(list); // [3, 2, 1]
// }

/// 静的な拡張メソッドを宣言することはできない
/// だが、拡張メソッドの中で呼び出すヘルパ関数として利用することは可能
extension SwapList2<T> on List<T> {
  // 静的メソッド（拡張メソッドから呼び出し可能）
  /// ただし以下のコードは、静的メソッドが拡張メソッドが拡張している型の型パラメータを参照しているのでエラーとなる
  /// 拡張メソッドが拡張している型が型パラメータを使用していないなら、静的メソッドを宣言することは可能
  // static bool noNeedToSwap(List<T> list) {
  //   return list.isEmpty;
  // }

  /// 以下のように、拡張メソッドの中で呼び出すヘルパ関数として利用することは可能
  // 非静的メソッド（拡張メソッドから呼び出し可能）
  bool noNeedToSwap() {
    return this.isEmpty;
  }

  void swap(int index1, int index2) {
    if (noNeedToSwap()) {
      return;
    }
    final tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }
}

// void List2_12_18() {
//   final list = [1, 2, 3];
//   list.swap(0, 2);
//   print(list); // [3, 2, 1]
// }

/// 拡張メソッドが拡張している型が型パラメータを使用していないなら、静的メソッドを宣言することは可能
extension SwapList3 on List {
  // 静的メソッド（拡張メソッドから呼び出し可能）
  static bool noNeedToSwap(List list) {
    return list.isEmpty;
  }

  void swap(int index1, int index2) {
    if (noNeedToSwap(this)) {
      return;
    }
    final tmp = this[index1];
    this[index1] = this[index2];
    this[index2] = tmp;
  }
}

void List2_12_19() {
  final list = [1, 2, 3];
  list.swap(0, 2);
  print(list); // [3, 2, 1]

  // 拡張メソッド以外からは呼び出せない
  // List.noNeedToSwap(list); // The method 'noNeedToSwap' isn't defined for the class 'List'.
}
