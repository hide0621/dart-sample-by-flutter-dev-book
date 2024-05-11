/// 高度なenumの書き方

/// 以下はフィールドやメソッド、factoryコンストラクタ、constantコンストラクタを持つenumの書き方
enum Shape1 {
  circle(corner: 0),
  triangle(corner: 3),
  square(corner: 4); // セミコロンをつける。「,」にするとエラーになる！

  final int corner;

  const Shape1({required this.corner});

  factory Shape1.ellipse() {
    return Shape1.circle;
  }

  // ゲッターを書いてみた
  int get getCorner => corner;
}

void List2_12_244() {
  final ellipse = Shape1.ellipse();
  print(ellipse.corner);
  print(ellipse.getCorner);
}
