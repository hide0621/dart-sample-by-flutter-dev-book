/// 高度なenumの書き方

enum Shape1 {
  circle(corner: 0),
  triangle(corner: 3),
  square(corner: 4); // セミコロンをつける。「,」にするとエラーになる！

  final int corner;

  const Shape1({required this.corner});

  factory Shape1.ellipse() {
    return Shape1.circle;
  }
}

void List2_12_244() {
  final ellipse = Shape1.ellipse();
  print(ellipse.corner);
}
