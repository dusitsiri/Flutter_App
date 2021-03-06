import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_login_page_ui/screens/profile_screen.dart';

class ReviewScreen extends StatefulWidget {
  
  
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: InkWell(
          splashColor: Colors.grey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ],
          ),
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
        ),
        centerTitle: true,
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                'Reviews Feed',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: new Icon(
              Icons.rate_review,
              color: Colors.black,
            ),
            tooltip: 'rate review',
            onPressed: (){
              Navigator.pushNamed(context, '/rate_reviews');
            },
          ),
          IconButton(
            icon: new Icon(
              Icons.portrait,
              color: Colors.black,
            ),
            tooltip: 'my profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          SizedBox(
            width: ScreenUtil.getInstance().setWidth(10),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('My Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
