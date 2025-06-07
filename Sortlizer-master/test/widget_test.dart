// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// This is a simple counter app widget that will be tested.
// It's defined here within the test file, not in your main application code.
class SimpleCounterApp extends StatefulWidget {
  const SimpleCounterApp({Key? key}) : super(key: key);

  @override
  State<SimpleCounterApp> createState() => _SimpleCounterAppState();
}

class _SimpleCounterAppState extends State<SimpleCounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Counter Test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Test App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}


void main() {
  testWidgets('Simple Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // We're building a self-contained SimpleCounterApp here,
    // which does NOT rely on your main.dart or any services from your main project.
    await tester.pumpWidget(const SimpleCounterApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}