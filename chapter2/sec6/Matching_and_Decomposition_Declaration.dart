// マッチングと分解宣言の例

// リストの場合
// 分解宣言をさせるためには、要素数が同じ必要がある
// ...を使うことで、要素数を合わせることができる
void List2_6_8() {
  final [a, b, ..., c] = [1, 2, 3, 4, 5];
  print('a: $a, b: $b, c: $c'); // a: 1, b: 2, c: 5
}

// Mapの場合
// 分解宣言をさせるためには、キーが同じ必要がある（ただし全てのキーとマッチさせる必要はない）
void List2_6_9() {
  final {
    200: successful,
    404: notFound
  } = {200: 'OK', 404: 'Not Found', 500: 'Internal Server Error'};
  print('200: $successful, 404: $notFound'); // 200: OK, 404: Not Found
}

// Recordの場合（名前付きフィールド）
// 位置フィールドの場合はList2_6_2を参照
// 分解宣言をさせるためには、フィールド名が全て一致している必要がある
void List2_6_10() {
  final record = (name: 'Alice', age: 20);

  // このようにフィールド名と完全一致させる必要がある
  final (name: n, age: a) = record;
  print('name is $n, age is $a'); // name is Alice, age is 20

  // 以下はエラーになる
  // final {name, age} = record;
  // print('name is $name, age is $age');
}

// Recordの場合（名前付きフィールドで、フィールド名を変数名で推論させる記法）
void List2_6_11() {
  final record = (name: 'Alice', age: 20);
  final (:name, :age) = record; // フィールド名を変数名で推論させる
  print('name is $name, age is $age'); // name is Alice, age is 20
}

class SomeClass {
  const SomeClass(this.x);
  final int x;
}

// クラスの場合（ゲッター（フィールド）を分解宣言）
void List2_6_12() {
  final someInstance = SomeClass(123);
  print('x = ${someInstance.x}'); // x = 123
  final SomeClass(x: number) = someInstance; // ゲッター（フィールド）を分解宣言
  print('x = $number'); // x = 123
}
