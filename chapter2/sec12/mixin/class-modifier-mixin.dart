/// mixin修飾子
///
///

mixin class Horse {
  void run() {
    print('run');
  }
}

mixin Bird {}

class Pegasus with Bird, Horse {}

/// mixinと同様に、extendsは使えずコンストラクも宣言できない
// mixin class Fish extends Bird {}
// mixin class Fish extends Horse {}
// mixin class Fish extends Pegasus {}

/// これもできない（mixinはクラスではないので？）
// class Fish extends Bird {}
// mixin Fish extends Pegasus {}

/// これはできる（mixinと同様？）
class Pegasus2 extends Horse {
  Pegasus2();
}

List2_12_32() {
  /// mixinを付与したクラスはインスタンス化は可能
  final horse = Horse();
  horse.run();
}
