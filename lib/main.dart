// Author: Arbaaz
// Desc: This is demonstration of responsiveness
// in a design using FractionallySizedBox widget.
// All the cards and their elements are fully
// resigning and stays on the original intended positions.

// Screenshots of the app are included in the screenshots folder.
// Github link: https://github.com/arbaazaj/assignment_internshala_arbaaz

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
      // Added Padding to add some space to all the cards.
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // Using column and row here as no overlapping of widgets is required
        // unlike the second card where the grey element is overlapping the card.
        child: Column(
          children: [
            // Card 1
            // Here I've used FractionallySizedBox to achieve
            // responsiveness for the card and other elements.
            // The widthFactor property takes the whole available space and height is left to default.
            FractionallySizedBox(
              widthFactor: 1,
              // Using the container here to apply box shadow to the card.
              // I'm not using elevation of the card here on intention
              // as I wanted to recreate the design as close as possible.
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFFc0c0c0),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(5, 3),
                  ),
                ]),
                // First card starts from here and the colors are saved in the colors.dart file.
                // First base card with red color.
                child: Card(
                  color: baseCardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Added a flexible widget to correctly display both the widgets.
                            Flexible(
                              // The widthFactor for this FractionallySizedBox is set to 0.3
                              // to achieve a small size element as shown in the figma design.
                              // Grey element inside the card.
                              child: FractionallySizedBox(
                                widthFactor: 0.3,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0),
                                  child: Container(
                                    color: greyCardColor,
                                    // I've used Text widget as a placeholder to display the container without
                                    // providing any width or height.
                                    child: const Text(''),
                                  ),
                                ),
                              ),
                            ),
                            // I've also added a Tooltip help icon to display the information
                            // as to what was used to achieve responsiveness.
                            const Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Tooltip(
                                preferBelow: true,
                                // Tap on the Tooltip to display the message.
                                triggerMode: TooltipTriggerMode.tap,
                                message:
                                    'Using column and row for the tooltip and the element. Using FractionallySizedBox for responsive design',
                                child: Icon(Icons.help,
                                    color: greenCardColor, size: 18.0),
                              ),
                            ),
                          ],
                        ),
                        // The green element inside the card using 97% of the width.
                        FractionallySizedBox(
                          widthFactor: 0.97,
                          child: Container(
                            color: greenCardColor,
                            child: const Text(''),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Added a SizedBox to add some space between the cards.
            const SizedBox(
              height: 80.0,
            ),
            // Card 2
            // Using SizedBox to fix the height of the card
            // otherwise it will shrink because Stack is used
            // and it lays all element on top of each other.
            SizedBox(
              width: double.maxFinite,
              height: 60.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: FractionallySizedBox(
                  widthFactor: 0.95,
                  child: Container(
                    height: 70.0,
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
                        // Using Stack here to achieve the overlapping
                        // of the grey element on top of the card.
                        child: Stack(
                          // This clipBehavior helps in making sure that the grey element is fully visible.
                          clipBehavior: Clip.none,
                          fit: StackFit.loose,
                          children: [
                            const Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Tooltip(
                                preferBelow: true,
                                triggerMode: TooltipTriggerMode.tap,
                                message:
                                    'Using Stack to position the elements inside and using FractionallySizedBox for responsive design',
                                child: Icon(Icons.help,
                                    color: greenCardColor, size: 18.0),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: FractionallySizedBox(
                                widthFactor: 1,
                                child: Container(
                                  color: greenCardColor,
                                  child: const Text(''),
                                ),
                              ),
                            ),
                            // The grey element which is overlapping and has a fixed position
                            // even on changing the width and height of the device.
                            // This is fully responsive even in landscape mode.
                            Positioned.fill(
                              // This top property offsets (move) the element by -25 from the original position.
                              top: -25,
                              child: Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: FractionallySizedBox(
                                  widthFactor: 0.3,
                                  heightFactor: 0.4,
                                  child: Container(
                                    color: greyCardColor,
                                    child: const Text(''),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
