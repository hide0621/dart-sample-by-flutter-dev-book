/// 高度なenumの書き方
///
/// 高度なenumを書くためには以下の条件を満たさなければならない
///
/// ・1つ以上のインスタンス（列挙子のこと？）が冒頭で宣言されていなくてはならない
/// ・インスタンス変数はfinalでなければならない（mixinで追加されるものも同様）
/// ・他のクラスを継承することはできない
/// ・index, hashCode, ==演算子をオーバーライドすることはできない
/// ・valuesという名前のメンバを宣言することはできない

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

void List2_12_2444() {
  final ellipse = Shape1.ellipse();
  print(ellipse.corner);
  print(ellipse.getCorner);
}
