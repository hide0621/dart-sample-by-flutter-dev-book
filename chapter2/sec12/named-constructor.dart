/// 名前付きコンストラクタ
///
/// クラスに複数のコンストラクタを宣言する場合や、特別な意味を持ったオブジェクトを生成する場合に使われる
///
/// 通常のコンストラクタはクラス名で宣言するが、
/// 名前付きコンストラクは `クラス名.識別子` で宣言する
class Point {
  const Point(this.x, this.y);
  const Point.zero()
      : x = 0,
        y = 0; // 名前付きコンストラクタ

  final int x;
  final int y;
}

void List2_12_7() {
  const point1 = Point(1, 2);
  const point2 = Point.zero(); // 名前付きコンストラクタを使って生成
  print('${point1.x}, ${point1.y}'); // 1, 2
  print('${point2.x}, ${point2.y}'); // 0, 0
}
