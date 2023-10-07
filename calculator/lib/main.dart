import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // String res = "", text = "";
    // int first, second;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.calculate_outlined,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            padding: EdgeInsets.all(10.0),
            alignment: Alignment.bottomRight,
            child: Text(
              text,
              style: TextStyle(fontSize: 65.0, fontWeight: FontWeight.w400),
            ),
          )),
          Row(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("7"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("8"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("9"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("/"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("4"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("5"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("6"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("*"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("1"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("2"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("3"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("-"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                height: 80,
              ),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("C"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("0"),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("="),
              SizedBox(
                width: 10,
              ),
              customOutlinedButton("+"),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget customOutlinedButton(String val) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () => buttonPressed(val),
        child: Text(
          val,
          style: TextStyle(fontSize: 25.0),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(35, 16, 35, 16),
        ),
      ),
    );
  }

  String res = "", text = "";
  String opperator = "";
  late double first;
  late double second;
  buttonPressed(String val) {
    if (val == "C") {
      text = "";
      res = "";
      opperator = "";
    } else if (val == "+" || val == "-" || val == "*" || val == "/") {
      first = double.parse(text);
      res = "";
      opperator = val;
    } else if (val == "=") {
      second = double.parse(text);
      if (opperator == "+") res = (first + second).toString();
      if (opperator == "-") res = (first - second).toString();
      if (opperator == "*") res = (first * second).toString();
      if (opperator == "/") res = (first / second).toString();
    } else {
      res = text + val;
    }
    setState(() {
      text = res;
    });
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // Delay for 3 seconds
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => MyHomePage(title: 'Calculator'),
        ),
      );
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "🧮 Calculator",
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            // LinearProgressIndicator(),
            CircularProgressIndicator(), // You can use a loading indicator here
          ],
        ),
      ),
    );
  }
}
