import 'package:emploitgate/api/api.dart';
import 'package:emploitgate/screens/alten.dart';
import 'package:emploitgate/screens/chat.dart';
import 'package:emploitgate/screens/holiday.dart';
import 'package:emploitgate/screens/home.dart';
import 'package:emploitgate/screens/scan.dart';
//import 'package:emploitgate/screens/showattrend.dart';
import 'package:emploitgate/screens/showresultscan.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
//int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
 List<Widget> screens;
  
  @override
  void initState() {
   super.initState();
     screens=<Widget>[
    const Scan(), AlTen(),Chat(),const Home(),ShowResltAttend()
  ];
   
  }
  int current=2;
  @override
  Widget build(BuildContext context) {
    
    Api.checkDate();
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: current,
          height: 60.0,
          items: <Widget>[
            Image.asset('assets/scan.png', height:30),
             Image.asset('assets/attend.png', height:30),
              Image.asset('assets/home.png', height:30),
            Image.asset('assets/break.png', height:30),
            Image.asset('assets/Holiday.png', height:30)
           // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.indigo[700],
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.amber[700],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              current = index;
            });
          },
          letIndexChange: (index) => true,
        ),
       
         body: screens[current], 
        );
  }
}