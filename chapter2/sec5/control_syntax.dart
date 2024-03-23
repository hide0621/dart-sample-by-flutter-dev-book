// if-case文
void List2_5_1() {
  final (String?, int?) response = ('OK', 200);
  // final (String?, int?) response = (null, 200);

  // Recordのフィールドの型が一致していて、かつ、nullか否かを判定
  if (response case (String message, int code)) {
    print('Response: $message, code: $code');
  } else {
    print('No response received');
  }
}
