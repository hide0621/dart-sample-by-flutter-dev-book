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

/// フィールドやfactoryコンストラクタ、constコンストラクタを持つenumを作りたい
/// ただし上記のようなenumは作成できない
/// そのため下記のように
/// ・プライベートなコンストラクタを定義してこのファイル内でしか作成できないようにする
/// ・静的なフィールドを定義して、プライベートなコンストラクタの結果を受けるように定義（オブジェクトになる）
/// ・ファクトリメソッドを定義して、enumを模したオブジェクトを作成する
/// という方法で実装する
// enum Shape2 {
//   circle(corner : 0),
//   triangle(corner : 3),
//   square(corner : 4),
//
//   final int corner;
//
//   const Shape2({required this.corner});
//
//   factory Shape2.ellipse() {
//     return Shape2.circle;
//   }
// }
//
// void List2_12_24() {
//
//   final ellipse = Shape2.ellipse();
//   print(ellipse.corner);
// }

/// 上記のコードは以下のコードと同じ意味になる
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

/// ただしどう言う訳か、この書き方なら先述の出来ないとされていた高度なEnumも表現できる...
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
