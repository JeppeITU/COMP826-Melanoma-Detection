import 'package:flutter/material.dart';
import 'screens/accounts.dart';
import 'screens/homeScreen.dart';
import 'screens/history_screen.dart';
import 'screens/how_it_works_screen.dart';
import 'screens/tutorial_screen.dart';
import 'screens/about_team_screen.dart';
import 'screens/contact_screen.dart';

//class to display drawer menu / sliding menu
class DrawerMenu extends StatelessWidget {
  final String account;

  const DrawerMenu({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile( //HOME
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen(account: account)),
              );
            },
          ),
          ListTile( //HISTORY
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen(account: account)),
              );
            },
          ),
          ListTile( //HOW IT WORKS
            leading: Icon(Icons.info),
            title: Text('How It Works'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HowItWorksScreen(account: account)),
              );
            },
          ),
          ListTile( //TUTORIAL
            leading: Icon(Icons.help),
            title: Text('Tutorial for App'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => TutorialScreen(account: account)),
              );
            },
          ),
          ListTile( //ABOUT TEAM
            leading: Icon(Icons.group),
            title: Text('About the Team'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => AboutTeamScreen(account: account)),
              );
            },
          ),
          ListTile( //CONTACT
            leading: Icon(Icons.contact_mail),
            title: Text('Contact'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ContactScreen(account: account)),
              );
            },
          ),
          ListTile( //LOGOUT
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}