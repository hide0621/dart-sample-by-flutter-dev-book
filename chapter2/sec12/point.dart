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

void List2_12_1() {
  final point1 = Point1();
  final point2 = Point2(10, 20);

  print('point1: (${point1.x}, ${point1.y})');
  print('point2: (${point2.x}, ${point2.y})');
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
