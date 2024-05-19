/// sealed修飾子

sealed class Shape {
  abstract int corner;
}

void List2_12_33() {
  /// インスタンス化はNG（sealed修飾子が付与されたクラスは暗黙的にabstract classとなるので）
  // final shape = Shape(); // Abstract classes can't be instantiated.
  print('sealed修飾子はabstract classとして扱われるため、インスタンス化はできない');
}
