import 'package:childhood_illness_search_engine/res/style.dart';
import 'package:childhood_illness_search_engine/screens/favourites/favourites.dart';
import 'package:childhood_illness_search_engine/screens/home/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Main());

const List<Widget> pages = <Widget>[Home(), Favourites()];

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: PrimaryColor.lightBlue,
        body: SafeArea(child: pages.elementAt(_selectedIndex)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favourites",
            ),
          ],
        ),
      ),
    );
  }
}
