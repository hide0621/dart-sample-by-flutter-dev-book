import 'class-modifier-abstract-interface.dart';

class Dog implements Animal {
  @override
  String greet() => 'bow-wow';
}

void List2_12_30() {
  final dog = Dog();
  print(dog.greet()); // bow-wow
}
