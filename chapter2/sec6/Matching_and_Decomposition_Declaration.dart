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