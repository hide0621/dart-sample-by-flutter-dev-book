import 'my_library.dart';

void main() {
  print(publicVariable); // これは動作する
  publicFunction(); // これも動作する

  // print(_privateVariable); // これはエラーになる
  // _privateFunction(); // これもエラーになる
}
