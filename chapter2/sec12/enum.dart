/// Enumについて

enum Shape {
  /// 以下は列挙子
  circle,
  triangle,
  square,
}

void List2_12_23() {
  // ここでenumのオブジェクト(Shape型のtriangleというオブジェクト)を作成している
  /// enumの利用方法は「enumの型名.列挙子名」という形で呼び出す
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

  /// enumの型には全ての列挙子をリストで得られるvaluesプロパティがある
  // 上で生成したshapeとは別のShape型の引数をラムダ（コールバック関数）に渡している
  // これはそれぞれのshapeが異なるスコープにあるからである
  // 上のshapeはList2_12_23関数内で定義されているが、このshapeはforEachメソッドのコールバック関数のスコープ内で定義されている
  Shape.values.forEach((shape) {
    print(shape.name);
  });

  /// enumの利用方法は「enumの型名.列挙子名」という形で呼び出す
  final myShape = Shape.circle;
  assert(myShape == Shape.circle);
  // assert(myShape == Shape.triangle); // AssertionError

  /// enumの各列挙子はインデックスを持っていて、ゲッターから取得できる
  print(myShape.index); // Prints: 0
  print(Shape.triangle.index); // Prints: 1
  print(Shape.square.index); // Prints: 2

  /// また列挙子の名前をString型で取得できえうnameプロパティも持っている
  print(myShape.name); // Prints: circle
  print(Shape.triangle.name); // Prints: triangle
  print(Shape.square.name); // Prints: square
}

/// フィールドやメソッド、factoryコンストラクタ、constコンストラクタを持つenumを作りたい

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

/// 上記のようなenumを作る代わりに
/// そのため下記のように
/// ・プライベートなコンストラクタを定義してこのファイル内でしか作成できないようにする
/// ・静的なフィールドを定義して、プライベートなコンストラクタの結果を受けるように定義（オブジェクトになる）
/// ・ファクトリメソッドを定義して、enumを模したオブジェクトを作成する
/// という方法で実装する
/// 下記のコードは上記のコードと意味は同じである
class Shape2 {
  final int corner;

  const Shape2._({required this.corner});

  static const Shape2 circle = Shape2._(corner: 0);
  static const Shape2 triangle = Shape2._(corner: 3);
  static const Shape2 square = Shape2._(corner: 4);

  static Shape2 ellipse() {
    return Shape2.circle;
  }
}

void List2_12_24() {
  final ellipse = Shape2.ellipse();
  print(ellipse.corner); // Prints: 0
}

/// 別の高度なEnumの例
/// [参照] https://dart.dev/language/enums#declaring-enhanced-enums
enum Vehicle implements Comparable<Vehicle> {
  car(tires: 4, passengers: 5, carbonPerKilometer: 400),
  bus(tires: 6, passengers: 50, carbonPerKilometer: 800),
  bicycle(tires: 2, passengers: 1, carbonPerKilometer: 0);

  const Vehicle({
    required this.tires,
    required this.passengers,
    required this.carbonPerKilometer,
  });

  final int tires;
  final int passengers;
  final int carbonPerKilometer;

  int get carbonFootprint => (carbonPerKilometer / passengers).round();

  bool get isTwoWheeled => this == Vehicle.bicycle;

  // factoryコンストラクタも書いてみた
  /// enumの利用方法は「enumの型名.列挙子名(メソッド名も同様)」という形で呼び出す
  factory Vehicle.truck({required int passengers}) {
    return Vehicle.car;
  }

  @override
  int compareTo(Vehicle other) => carbonFootprint - other.carbonFootprint;
}

void List2_12_25() {
  final car = Vehicle.truck(passengers: 5);
  print(car.carbonFootprint); // Prints: 80
}
