// Here our aim is to create the home page of the app to get it out of the main.dart file to different file and so one for management as it may get complex
import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlich_theme.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // TODO: Add state variables and functions
  int _selectedindex = 0;
  static List<Widget> pages = <Widget>[
    // TODO: replace with card1
    Container(
      color: Colors.red,
    ),
    // TODO: replace with card2
    Container(
      color: Colors.blue,
    ),
    // TODO: replace with card3
    Container(
      color: Colors.green,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          // The theme.of(context) returns the nearest Theme in the widget tree. If widget has defined Theme then it returns thta otherwise it returns the app's theme
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      // TODO: Show selected tab
      body: pages[_selectedindex],
      //  Center(
      //   child: Text(
      //     'Let\'s get cooking 👨‍🍳',
      //     style: Theme.of(context).textTheme.headline1,
      //   ),
      // ),
      // TODO: Add bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        // TODO: set selected tab bar
        currentIndex: _selectedindex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
    return scaffold;
  }
}
