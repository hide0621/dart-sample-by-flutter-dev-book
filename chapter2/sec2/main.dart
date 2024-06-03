import 'built_in_type.dart';

void main() {
  // List2_2_1();
  // List2_2_2();
  // List2_2_3();
  // test();
  List2_2_4();
}

void test() {
  var x = 'a';
  var y = 'b';
  if (x == 'a') {
    print('x is a'); // これ以降の処理は判定されない
  } else if (y == 'b') {
    print('y is b');
  } else {
    print('hoge');
  }
}
