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

void List2_1_4() {
  // 初期化を遅延させる
  late String globalVariable;

  void initializeGlobalVariable() {
    globalVariable = '初期化';
    print(globalVariable);
  }

  initializeGlobalVariable();
}

void List2_1_5() {
  // 初期化を遅延させて、一度初期化さえたら変更不可にさせる
  late final String globalName;

  void initializeGlobalName() {
    globalName = '太郎';
    // globalName = '次郎'; // Error: Can't assign to the final variable 'globalName'.
    print(globalName);
  }

  initializeGlobalName();
}

void List2_1_6() {
  // 処理の重い関数を定義
  String highCostFunction() {
    return '高コストな処理';
  }

  // 上記関数の結果を代入させることで初期値が与えられるので、
  // variableが呼ばれるまで初期化を遅らせる
  // こうすることで後続の処理の負担を下げることができる
  late String variable = highCostFunction();

  // ここで初期化される
  print(variable);
}
