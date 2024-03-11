void List2_2_1() {
  var name = 'dart';

  var str1 = 'こんにちは、$nameさん';

  print(str1);

  var str2 = 'こんにちは、${name.toUpperCase()}さん';

  print(str2);
}
