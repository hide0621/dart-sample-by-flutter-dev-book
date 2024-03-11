void List2_1_1() {
  var age = 0;

  final num = 10;

  const num2 = 20;

  print(age);
  print(num);
  print(num2);
}

void List2_1_2() {
  final flag = DateTime.now().hour.isEven;

  final int number; // あとで初期化もできる

  if (flag) {
    number = 10;
  } else {
    number = 20;
  }
  print(number);
}

// void List2_1_3() {
//   final name = '太郎';
//
//   final int number; // あとで初期化もできる
//
//   if (name == '次郎') {
//     number = 10;
//   } else if (name == '三郎') {
//     number = 20;
//   }
//   // 利用時までに初期化がなされないのならエラーが出る
//   // Error: Final variable 'number' must be assigned before it can be used.
//   print(number);
// }
