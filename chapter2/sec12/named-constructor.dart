/// 名前付きコンストラクタ
///
/// クラスに複数のコンストラクタを宣言する場合や、特別な意味を持ったオブジェクトを生成する場合に使われる
///
/// 通常のコンストラクタはクラス名で宣言するが、
/// 名前付きコンストラクは `クラス名.識別子` で宣言する
class Point {
  const Point(this.x, this.y);

  /// 名前付きコンストラクタ zero が直接インスタンス変数 x と y を初期化しています。
  /// このコンストラクタは、x と y を0に設定した Point オブジェクトを生成します。
  const Point.zero()
      : x = 0,
        y = 0; // 名前付きコンストラクタ

  final int x;
  final int y;
}

/// コンストラクから自クラスの別のコンストラクタを呼び出すことも可能
class Point2 {
  const Point2(this.x, this.y);

  /// 名前付きコンストラクタ zero が別のコンストラクタ Point2(this.x, this.y) を呼び出しています。
  /// この this(0, 0) は、x と y を0に設定した Point2 オブジェクトを生成するための Point2 コンストラクタを呼び出すことを意味します。
  const Point2.zero() : this(0, 0); // 通常のコンストラクタを使って生成

  final int x;
  final int y;
}

void List2_12_7() {
  const point1 = Point(1, 2);
  const point2 = Point.zero(); // 名前付きコンストラクタを使って生成
  print('${point1.x}, ${point1.y}'); // 1, 2
  print('${point2.x}, ${point2.y}'); // 0, 0
}

void List2_12_8() {
  const point1 = Point2(1, 2);
  const point2 = Point2.zero(); // 名前付きコンストラクタを使って生成
  print('${point1.x}, ${point1.y}'); // 1, 2
  print('${point2.x}, ${point2.y}'); // 0, 0
}
