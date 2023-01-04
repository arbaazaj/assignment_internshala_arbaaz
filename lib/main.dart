import 'package:assignment_internshala_arbaaz/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Responsive Design'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Card 1
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFFc0c0c0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(5, 3),
                  ),
                ]),
                child: Card(
                  color: baseCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.3,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Container(
                              color: greyCardColor,
                              child: const Text('Grey'),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.98,
                          child: Container(
                            color: greenCardColor,
                            child: const Text('Green'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80.0,
          ),
          // Card 2
          FractionallySizedBox(
            widthFactor: 1,
            child: Container(
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color(0xFFc0c0c0),
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(5, 3),
                ),
              ]),
              child: Card(
                elevation: 8.0,
                color: baseCardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    fit: StackFit.passthrough,
                    children: [
                      Positioned.fill(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: FractionallySizedBox(
                            widthFactor: 0.2,
                            child: Container(
                              color: greyCardColor,
                              child: const Text('Grey'),
                            ),
                          ),
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Container(
                          color: greenCardColor,
                          child: const Text('Green'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
