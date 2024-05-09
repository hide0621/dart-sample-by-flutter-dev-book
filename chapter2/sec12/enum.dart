/// Enumについて

enum Shape {
  circle,
  triangle,
  square,
}

void List2_12_23() {
  // ここでenumのオブジェクト(Shape型のtriangle)を作成している
  final shape = Shape.triangle;

  switch (shape) {
    case Shape.circle:
      print('円');
      break;
    case Shape.triangle:
      print('三角形');
      break;
    case Shape.square:
      print('四角形');
      break;
    default:
      print('不明');
  }
}
