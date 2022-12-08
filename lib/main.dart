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
  var itemSelectionne;

  var submitted;

  // Pour les RadioButton

  List<Widget> radios() {
    List<Widget> l = [];
    for (int x = 0; x < 2; x++) {
      Row row = Row(
        children: [
          Text("Choix Numero ${x + 1}"),
          Radio(
              value: x,
              groupValue: itemSelectionne,
              onChanged: (i) {
                setState(() {
                  itemSelectionne = i;
                });
              })
        ],
      );
      l.add(row);
    }
    return l;
  }

  // Pour les check BOX
  Map check = {
    "Carotttes": false,
    "Bananes": false,
    "Yaourt": false,
    "pain": false
  };

  List<Widget> checkList() {
    List<Widget> l = [];
    check.forEach((key, value) {
      Row row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(key),
          Checkbox(
              value: (value),
              onChanged: (b) {
                setState(() {
                  check[key] = b;
                });
              })
        ],
      );
      l.add(row);
    });
    return l;
  }

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
              Text(submitted ?? ''),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("CheckBOx button ",style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 22.0
                ),)],
              ),

              //Column pour les CheckBox
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: checkList(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Radio Button ",style: TextStyle(
                  color: Colors.red,
                  fontSize: 22.0
                ),)],
              ),
              Row(
                mainAxisAlignment:  MainAxisAlignment.center
                ,
                children: radios(),
              )
            ],
          ),
          
        ),
      ),
    );
  }
}
