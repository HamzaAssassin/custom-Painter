

import 'package:customclipper/cardashboard.dart';
//import 'package:customclipper/clockpainter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  void initState() {
    // Timer.periodic(
    //   const Duration(seconds: 1),
    //   ((timer) => setState(() {
    //         now = DateTime.now();
    //       })),
    // );
   
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    // var screenSize = MediaQuery.of(context).size;
    // var width = screenSize.width;
    // var height = screenSize.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: CustomPaint(
              painter: CarDashboardPainter(),
              child: LayoutBuilder(
                builder: (context, constraints) => SizedBox(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    //   body: Center(child: Container(
    //     height: 500,
    //     width: 500,
    //     //color: Colors.red,
    //     child:CustomPaint(
    //       painter: CarDashboardPainter(),
    //     ),)),
    // );
  }
}
