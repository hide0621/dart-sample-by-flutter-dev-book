import 'Getter-and-Setter.dart';
// import 'Orthodox-class-pattern.dart';

void main() {
  // List2_12_1();
  // List2_12_2();
  // List2_12_3();
  // List2_12_4();
  List2_12_5();

  /// 以下はprivate化されているものを呼び出しているのでエラーとなる
  /// private化されているものは同じファイル内でしか呼び出せない
  /// 他のファイルから呼び出す場合は、ゲッターを介して呼び出す
  // final user = User(1, 'password');
  // print(user._password);
}
