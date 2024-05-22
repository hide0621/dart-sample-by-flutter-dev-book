/// sealed修飾子
///
/// 特徴
///
/// - sealed修飾子を使うとサブクラス（サブタイプとも）をEnumのように扱うことができる
/// - sealed修飾子が付与されたクラスは暗黙的にabstract classとなる、故にインスタンス化はできない
/// - sealed修飾子が付与されたクラスは、そのファイル内でのみ継承が可能（自身が宣言されたライブラリ以外でのサブタイプ化は禁止）

sealed class Shape {
  abstract int corner;
}

void List2_12_33() {
  /// インスタンス化はNG（sealed修飾子が付与されたクラスは暗黙的にabstract classとなるので）
  // final shape = Shape(); // Abstract classes can't be instantiated.
  print('sealed修飾子はabstract classとして扱われるため、インスタンス化はできない');
}

/// 以下はsealed修飾子を用いて、サブタイプをEnumのように扱っている例

class Rectangle extends Shape {
  @override
  int corner = 4;
}

class Triangle extends Shape {
  @override
  int corner = 3;
}

class Circle extends Shape {
  @override
  int corner = 0;
}

void List2_12_34() {
  final rectangle = Rectangle();
  final triangle = Triangle();
  final circle = Circle();

  print('rectangle: ${rectangle.corner}');
  print('triangle: ${triangle.corner}');
  print('circle: ${circle.corner}');
}

Shape getShape() {
  return Rectangle();
}

void List2_12_35() {
  final shape = getShape();

  /// switch文で全てのサブタイプが網羅されていなければ、コンパイラが警告を出す
  ///
  /// 例：（Circleを満たしていない場合）The type 'Shape' is not exhaustively matched by the switch cases since it doesn't match 'Circle()'.
  switch (shape) {
    case Rectangle():
      print('Rectangle');
      break;
    case Triangle():
      print('Triangle');
      break;
    case Circle():
      print('Circle');
      break;
  }
}
