mixin Horse {
  void run() {
    print('run');
  }
}

mixin Bird {
  void fly() {
    print('fly');
  }
}

class Pegasus with Horse, Bird {}

void List2_12_21() {
  final pegasus = Pegasus();
  pegasus.run();
  pegasus.fly();
}
