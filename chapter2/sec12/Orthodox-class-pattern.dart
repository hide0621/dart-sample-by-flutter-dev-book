/// 最もオーソドックスな記述例
class Point1 {
  int x = 0;
  int y = 0;
}

/// 糖衣構文による記述例
///
/// コンストラクタ引数とインスタンス引数（フィールド）で分けている
class Point2 {
  Point2(int xPosition, int yPosition)
      : x = xPosition,
        y = yPosition;

  int x;
  int y;
}

/// このパターンはだめ（インスタンス変数が初期化される前に代入されているので）
// class Point2_1 {
//   Point2_1(int xPosition, int yPosition) {
//     x = xPosition; // Non-nullable instance field 'x' must be initialized
//     y = yPosition; // Non-nullable instance field 'y' must be initialized
//   }
//   int x;
//   int y;
// }

/// これならOK
class Point2_2 {
  Point2_2(int xPosition, int yPosition) {
    x = xPosition;
    y = yPosition;
  }
  int x = 0; // ここで初期化している
  int y = 0; // インスタンス変数が初期化済みなのでエラーを回避できる
}

void List2_12_1() {
  final point1 = Point1();
  final point2 = Point2(10, 20);

  print('point1: (${point1.x}, ${point1.y})');
  print('point2: (${point2.x}, ${point2.y})');

  final point2_2 = Point2_2(1, 2);
  print('point2_2: (${point2_2.x}, ${point2_2.y})');
}

/// thisキーワードを使った記述例
class Point3 {
  Point3(this.x, this.y);

  int x;
  int y;
}

void List2_12_2() {
  final point3 = Point3(30, 40);

  print('point3: (${point3.x}, ${point3.y})');
}

/// 初期化リストでパラメータのアサーションを記述することもできる
class Point4 {
  Point4(this.x, this.y)
      : assert(x >= 0),
        assert(y >= 0);

  int x;
  int y;
}

void List2_12_3() {
  final point4 = Point4(50, 60);

  // final point4 = Point4(-1,
  //     -1); // Unhandled exception: Failed assertion: line 67 pos 16: 'x >= 0': is not true.

  print('point4: (${point4.x}, ${point4.y})');
}
