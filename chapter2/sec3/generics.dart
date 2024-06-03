// ジェネリックなクラスを定義
class Foo<T> {
  T _value;
  Foo(this._value);

  T get value => _value;
}

// ジェネリクスを使った型パラメータなコードにすると、コードに柔軟性が生まれる
void List2_3_1() {
  var intFoo = Foo<int>(10);
  print(intFoo.value); // 10

  var stringFoo = Foo<String>('Hello, World!');
  print(stringFoo.value); // Hello, World!
}

// ジェネリックな関数を定義
T? firstOrNull<T>(List<T> items) {
  if (items.isEmpty) {
    return null;
  }
  return items.first;
}

void List2_3_2() {
  var numbers = [1, 2, 3];
  var firstNumber = firstOrNull(numbers);
  print(firstNumber); // 1

  var emptyList = <int>[];
  var firstEmpty = firstOrNull(emptyList);
  print(firstEmpty); // null
}
