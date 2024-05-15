/// abstract修飾子とinterface修飾子の組み合わせ
///
/// 上記2つの修飾子を組み合わせることで、下記のように実装を持たない純粋なインターフェースを定義することが可能になる
/// 外部ライブラリにおいては、implementsキーワードによる実装が強制される → Go言語のinterfaceに近い

abstract interface class Animal {
  String greet();
}
