import 'dart:async';

Future<void> main() async {
  final controller = StreamController<int>.broadcast();
  final inStream = controller.sink;
  final outStream = controller.stream;

  outStream
    .skip(1)
    .where((number) => number % 2 == 0)
    .map((number) => 'Stream value is: $number')
    .listen((event) => print(event));


  var numbers = List.generate(20, (index) => index);

  for (final number in numbers) {
    inStream.add(number);
    await Future.delayed(Duration(milliseconds: 500));
  }

  await controller.close();
}