import 'exception.dart';

void main() {
  // List2_7_1();
  // List2_7_2();
  // List2_7_3();
  // List2_7_4();

  // 例外の再スローを補足して、その例外を処理する方法
  try {
    List2_7_5(); // catch : Instance of 'MyException'
  } on MyException catch (e) {
    print(
        'Caught rethrown exception: $e'); // Caught rethrown exception: Instance of 'MyException'
  }
}
