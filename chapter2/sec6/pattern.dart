// パターン（マッチング）の例
// マッチングはオブジェクトが特定の形式かどうかを判定するための機能
void List2_6_1() {
  final name = 'Alice';
  switch (name) {
    case 'Alice': // nameが'Alice'と一致するか判定
      print('Alice');
      break;
    case 'Bob':
      print('Bob');
      break;
    default:
      print('Other');
  }
}

// パターン（分解宣言）の例
// 分解宣言はオブジェクトをいくつかの変数に分解する機能
void List2_6_2() {
  final record = ('Alice', 20);
  final (name, age) = record; // recordをnameとageに分解
  print('name is $name, age is $age');
}
