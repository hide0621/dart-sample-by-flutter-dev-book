/// sealed修飾子

sealed class Shape {
  abstract int corner;
}

void List2_12_33() {
  /// インスタンス化はNG（sealed修飾子が付与されたクラスは暗黙的にabstract classとなるので）
  // final shape = Shape(); // Abstract classes can't be instantiated.
  print('sealed修飾子はabstract classとして扱われるため、インスタンス化はできない');
}

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
