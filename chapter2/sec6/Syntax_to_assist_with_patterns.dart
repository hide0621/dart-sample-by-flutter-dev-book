// 分解宣言の際にas演算子を使い値を変数にキャストする
void List2_6_15() {
  final List<Object> List1 = [0, 'zero'];
  final [number as int, str as String] = List1;

  // 以下のコードはエラーになる（インデックスの要素の型とキャスト先の変数の型が異なっているので）
  // final [number as int, str as int] =
  //     List1; // Unhandled exception: type 'String' is not a subtype of type 'int' in type cast

  print('number: $number, str: $str'); // number: 0, str: zero
}

// nullチェック
void List2_6_16() {
  // int? code = 10;
  int? code = null;
  switch (code) {
    case final i? when i >= 0: // codeをiに分解宣言してマッチングさせている
      print('code is positive');
    default:
      print('code is null or negative');
  }
}

// nullアサーション
void List2_6_17() {
  int? code = 10;
  // int? code = null;
  switch (code) {
    // 分解宣言の変数iに関しては、警告文「The null-assert pattern will have no effect because the matched type isn't nullable. Try replacing the null-assert pattern with its nested pattern.」という警告が出る
    // これは変数i自体はnull許容型でないためである
    case final i! when i >= 0: // codeをiに分解宣言してマッチングさせている
      print(
          'code is positive'); // 値がnullの場合、このコードは実行されない  実行時エラー文「Unhandled exception: Null check operator used on a null value」
    default:
      print('code is negative');
  }
}

// ワイルドカードについて
// ワイルドカード_は、特定の型のオブジェクトが存在することを確認するために使用されるが、その詳細は無視される

// ワイルドカード 例１
void List2_6_18() {
  final record = ('cake', 100);
  final (name, _) = record; // ２番目の位置フィールド(要素)を無視する
  print('name: $name'); // name: cake
}

// ワイルドカード 例２

class SomeClass {}

void List2_6_19() {
  final valuable = SomeClass();
  // final valuable = 'hoge';
  switch (valuable) {
    case SomeClass _: // ワイルドカードを使ってvaluableの型を型注釈している
      print('valuable is SomeClass');
    case String _: // このケースは実行されない
      print('valuable is String');
  }
}

// 上記のワイルドカードのコードを書き換えると、以下のようにis演算子を用いる型チェックを使ったコードになる
void List2_6_20() {
  final valuable = SomeClass();
  // final valuable = 'hoge';

  if (valuable is SomeClass) {
    print('valuable is SomeClass');
  } else if (valuable is String) {
    print('valuable is String');
  }
}
