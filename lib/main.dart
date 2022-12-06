import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var changed;

  var submitted;

  // Pour les check BOX
  Map check = {
    "Carotttes": false,
    "Bananes": false,
    "Yaourt": false,
    "pain": false
  };



  @override
  Widget build(BuildContext context) {
    // return GestureDetector(
    //   onTap: (){
    //     FocusScope.of(context).requestFocus((new FocusNode()));
    //
    //   },
    // )
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Widget interractive",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                // keyboardType: TextInputType.text,
                keyboardType: TextInputType.number,
                onChanged: (String string) {
                  setState(() {
                    changed = string;
                  });
                },
                onSubmitted: (String string) {
                  submitted = string;
                },
                decoration: InputDecoration(labelText: "Entrer Votre Nom"),
              ),
              Text(changed ?? ''),
              Text(submitted ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
