Future<void> main() async {
  final interval = Duration(seconds: 2);
  var stream = Stream<int>.periodic(interval, callback);

  /// Allows the stream to be listened to by multiple parties
  stream = stream.asBroadcastStream();

  /// Limits the stream to it's first 5 values
  stream = stream.take(5);

  stream.listen((number) {
    print('Listening #1 - value: $number');
  });

  stream.listen((number) {
    print('Listening #2 - value: $number');
  });
}

int callback(int value) => (value + 1) * 2;