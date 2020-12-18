import 'package:flutter/material.dart';

import 'component.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  var _formValue = Map();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  final inputKode = TextEditingController();

  var iconSimpan = Icon(Icons.save);
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                inputTextLeftLabel("Kode",
                    controller: inputKode,
                    keyboardType: TextInputType.number,
                    maxLength: 5, validator: (value) {
                  if (value.isEmpty) {
                    return "Kode Harus Diisi Mas!";
                  }
                  return null;
                }, callback: (colname, value) {
                  _formValue[colname] = value;
                }),
                inputTextLeftLabel("Nama", maxLength: 10,
                    callback: (colname, value) {
                  _formValue[colname] = value;
                }),
                inputTextLeftLabel("Keterangan", callback: (colname, value) {
                  _formValue[colname] = value;
                }),
                inputTextLeftLabel("Harga", validator: (value) {
                  bool numValid = double.tryParse(value) != null;

                  if (!numValid) {
                    return "Harga Harus Diisi Angka Mas!";
                  }
                  return null;
                }, callback: (colname, value) {
                  _formValue[colname] = value;
                }),
                inputTextLeftLabel("Satuan", callback: (colname, value) {
                  _formValue[colname] = value;
                }),
                RaisedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      print(_formValue);
                    }
                  },
                  icon: iconSimpan,
                  label: Text("Simpan"),
                ),
                RaisedButton.icon(
                  onPressed: () {
                    _formKey.currentState.reset();
                    //inputKode.clear();
                    inputKode.text = "Reset";
                  },
                  icon: Icon(Icons.refresh),
                  label: Text("Reset"),
                )
              ],
            ),
          )),
    );
  }
}
