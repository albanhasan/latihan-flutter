import 'package:flutter/material.dart';
import 'login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
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
        ),
        home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            title: Text('2019230131-Albantani'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  icon: Icon(Icons.logout))
            ],
            //backgroundColor: Colors.orange,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              )),
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.calculate),
                  text: 'Home Input',
                ),
                Tab(
                  icon: Icon(Icons.calculate),
                  text: 'Grid Button',
                ),
                Tab(
                  icon: Icon(Icons.calculate),
                  text: 'ListView',
                ),
                Tab(
                  icon: Icon(Icons.calculate),
                  text: 'Images',
                ),
                Tab(
                  icon: Icon(Icons.calculate),
                  text: 'Alert',
                )
              ],
            ),
            elevation: 4,
          ),
          body: TabBarView(children: [
            Center(
              child: Text('halo1'),
            ),
            Center(
              child: Text('halo2'),
            ),
            Center(
              child: Text('halo3'),
            ),
            Center(
              child: Text('halo4'),
            ),
            Center(
              child: Text('halo5'),
            ),
          ]),
        ),
      );
}

Widget test(BuildContext context) {
  return Scaffold(body: Text("halo"));
}
