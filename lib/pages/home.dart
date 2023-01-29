import 'package:flutter/material.dart';
import 'package:test3/widget/list4.dart';
import '../widget/list2.dart';
import '../widget/list1.dart';
import '../widget/list3.dart';
import 'collect_page.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F8F8),
        textTheme: Theme.of(context).textTheme.apply(displayColor: const Color(
            0xFF1F0E0E),),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      backgroundColor: Colors.orange,
      body:const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    Body(),
    Body2(),
    Body3(),
    Body4(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.museum_outlined),
            label: 'BM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.museum_sharp),
            label: 'V&A',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.museum_rounded),
            label: 'NHM',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.museum_outlined),
            label: 'Tate',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
      ),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor:Colors.orange,
    elevation: 0,
    centerTitle: true,
    title: const Text('Collections Gallery'),
  );
}

