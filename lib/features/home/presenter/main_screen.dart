import 'package:flutter/material.dart';
import 'package:msglow/component/widget/app_style.dart';
import 'package:msglow/features/home/presenter/home_screen.dart';
import 'package:msglow/features/account/presenter/account_screen.dart';
import 'package:msglow/features/shopping/presenter/cart/cart_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _currentTabIndex = 0;
  final GlobalKey<ScaffoldState> _globalScaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalScaffoldKey,
      backgroundColor: Colors.white,
      body: _bodyContent(),
      bottomNavigationBar: _bottomNavigationBar(),
      drawer: _drawerContent(),
    );
  }

  Widget _bottomNavigationBar() => BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: _currentTabIndex,
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'Explore',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.local_offer_outlined),
        label: 'Offer',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: 'Account',
      )
    ],
    onTap: (index) {
      setState(() {
        _currentTabIndex = index;
      });
    },
  );

  Widget _bodyContent() => IndexedStack(
    index: _currentTabIndex,
    children: [
      HomeScreen(globalScaffoldKey: _globalScaffoldKey),
      Center(child: Text("Page not found")),
      CartScreen(),
      Center(child: Text("Page not found")),
      AccountScreen(),
    ],
  );

  Widget _drawerContent() => Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('Drawer Header'),
          decoration: BoxDecoration(
            color: AppStyle.primary,
          ),
        ),
        ListTile(
          title: Text('Item 1'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: Text('Item 2'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}
