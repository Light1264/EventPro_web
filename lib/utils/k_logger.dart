import 'package:logger/logger.dart';

// Logger appLogger(Type type) => Logger(printer: _KLogger(type.toString()));
Logger appLogger(Type type) => AppLogger(type);

class AppLogger extends Logger {
  final Type name;

  AppLogger(this.name) : super(printer: _KLogger(name.toString()));
  // AppLogger(this.name)
  //     : super(printer: PrefixPrinter(PrettyPrinter(colors: false)));
}

class _KLogger extends LogPrinter {
  final String className;
  _KLogger(this.className);

  @override
  List<String> log(LogEvent event) {
    // final color = PrettyPrinter.levelColors[event.level];
    final stackTrace = event.stackTrace;

    final message = event.message;

    return [
      //draw a line
      //to indicate start of print
      // "=" * 30,
      // color!("Class Name : $className"),
      "Class Name : $className",
      // color("TimeStamp : ${DateTime.now().toUtc().toLocal()}"),
      // color("Message : $message"),
      "Message : $message",
      if (stackTrace != null) "StackTrace=>:\n $stackTrace",
      //draw a line
      //to indicate end of print
      // "=" * 30,
    ];
  }
}
