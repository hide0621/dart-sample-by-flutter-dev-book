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
