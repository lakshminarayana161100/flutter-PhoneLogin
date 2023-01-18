import 'package:firebase_auth/firebase_auth.dart';
import 'package:phone_login/Tab_Pages/Market.dart';
import 'package:phone_login/Tab_Pages/My_Load.dart';
import 'package:phone_login/Tab_Pages/My_Lorry.dart';
import 'package:phone_login/Tab_Pages/Network.dart';
import 'package:flutter/material.dart';
import 'Tab_Pages/Home.dart';

class MainScreen extends StatefulWidget
{
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin
{
  TabController? tabController;
  int selectedIndex = 0;

  onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index =selectedIndex;
    });

  }

  @override
  void initState() {
    super.initState();

    tabController =TabController(length: 5, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children:  [
          MylorryTabPage(),
          MyloadTabPage(),
          HomeTabPage(),
          MapView(),
          NetworkTabPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Myload',
            backgroundColor: Colors.red,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.auto_mode),
            label: 'Mylorry',
            backgroundColor: Colors.yellowAccent,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Market',
            backgroundColor: Colors.pink,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.network_wifi),
            label: 'Network',
            backgroundColor: Colors.greenAccent
            ,
          )

        ],
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 14),
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}

