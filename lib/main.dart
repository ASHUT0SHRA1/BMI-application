import 'package:bmiapplication/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 var wtController = TextEditingController();
 var htController = TextEditingController();
 var inController = TextEditingController();
 var result ="";
 var bgColor = Colors.blue.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 100,),
                Text('BMI' , style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),),
                SizedBox(height: 20,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(  borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent)),
                    label: Text('Enter Your Weight in KG'),
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: htController,
                  decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(  borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent)),
                    label: Text('Enter Your height in Feet'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(

                      enabledBorder: OutlineInputBorder(  borderSide: BorderSide(width: 3, color: Colors.lightBlueAccent)),
                    label: Text('Enter Your Height(in inches)'),
                    prefixIcon: Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20,),
                ToggleSwitch(
                  labels: [
                    'Male',
                    'Female',
                    'Other'
                  ],
                  fontSize: 30,
                  minHeight: 90,
                  minWidth: 120,
                  cornerRadius: 30,


                    activeBgColors: [[Colors.blue], [Colors.pink], [Colors.purple]],

                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ht = htController.text.toString();
                  var inch = inController.text.toString();

                  if(wt != "" && ht != "" && inch != ""){
                    var iWt = int.parse(wt);
                    var iht = int.parse(ht);
                    var iinch = int.parse(inch);

                    var tInch = iht*12 + iinch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = iWt/(tM*tM);
                    var msg = "";
                    if(bmi > 25){
                      msg = "Overweight";
                       bgColor = Colors.orange.shade300;
                    }
                    else if (bmi < 20){
                      msg = "UnderWeight";
                      bgColor = Colors.red.shade200;
                    }
                    else{
                      msg = "Healthy";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "You are $msg  \nYour BMI is : ${bmi.toStringAsFixed(2)}";
                    });

                  }
                  else{
                    setState(() {
                      result = "fill all the required blanks";
                    });

                  }
                }, child: Text('Calculate' , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.w700),),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      side: BorderSide(width:3, color:Colors.lightBlueAccent), //border width and color
                      elevation: 6, //elevation of button
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: EdgeInsets.all(20) //content padding inside button
                  )),
                  SizedBox(height: 20,),
                  Text(result, style: TextStyle(fontSize: 20),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
