/// constantコンストラクター
///
/// オブジェクトをコンパイル時定数として扱うには、コンストラクターを[const]で宣言します。
/// インスタンス変数は全て再代入不可な[final]で宣言する必要があります。
///
/// constキーワードを付与したコンストラクタを使ってオブジェクトを生成したり、
/// そのオブジェクトを別のconst変数に代入することで、コンパイル時定数として扱うことができます。
/// これにより、常に同じオブジェクトが参照されるようになる（Go言語のポインタ型のオブジェクトに似ている）

class Point {
  const Point(this.x, this.y);

  final int x;
  final int y;
}

void List2_12_6() {
  // const point = Point(1, 2);
  // print(point.x);
  // print(point.y);
  // point.x = 3; // Error: The setter 'x' isn't defined for the class 'Point'.

  final point1 = const Point(1, 2); // constantコンストラクタの前にconstキーワードを付与
  const point2 = Point(1, 2); // constキーワードを付与した変数に代入
  final point3 = Point(1, 2); // そのどちらでもない
  print('${point1 == point2}'); // true
  print('${point1 == point3}'); // false
}
