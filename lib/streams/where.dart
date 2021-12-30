Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  /// Selects values that satifies the given condition
  stream = stream.where((number) => number % 2 == 0).take(5);

  stream.listen((number) {
    print('Listened value: $number');
  });
}

int callback(int value) => (value + 1) * 2;