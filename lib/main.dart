import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "BMI",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var incontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI"),
      ),
      body: Center(
          child: Container(
        color: bgcolor,
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BMI",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 6),
            TextField(
              controller: wtcontroller,
              decoration: InputDecoration(
                  label: Text("Enter Your Weight (in Kgs)"),
                  prefixIcon: Icon(Icons.line_weight)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: ftcontroller,
              decoration: InputDecoration(
                  label: Text("Enter Your Height (in Feet)"),
                  prefixIcon: Icon(Icons.height)),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
                controller: incontroller,
                decoration: InputDecoration(
                    label: Text("Enter Your Height (in Inches)"),
                    prefixIcon: Icon(Icons.height)),
                keyboardType: TextInputType.number),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  var wt = wtcontroller.text.toString();
                  var ft = ftcontroller.text.toString();
                  var inch = incontroller.text.toString();

                  if (wt != "" && ft != "" && inch != "") {
                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var tInch = (iFt * 12) + iInch;
                    var tCm = tInch * 2.56;
                    var tM = tCm / 100;

                    var Bmi = iWt / (tM * tM);

                    var msg = "";

                    if (Bmi > 45) {
                      msg = "You are Overweight!!";
                      bgcolor = Colors.orange.shade200;
                    } else if (Bmi < 18) {
                      msg = "You are Underweight!!";
                      bgcolor = Colors.red.shade200;
                    } else {
                      msg = "You are Healthy!!";
                      bgcolor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "Your bmi is: ${Bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }
                },
                child: Text("Calculate")),
            SizedBox(height: 10),
            Text(result, style: TextStyle(fontSize: 20)),
          ],
        )),
      )),
    );
  }
}
