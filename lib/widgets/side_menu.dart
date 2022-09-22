import 'package:flutter/material.dart';
import 'package:preferences_app/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const _DrawerHeader(),

          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: (){
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);

            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('People'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: (){
              Navigator.pushReplacementNamed(context, SettingsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DrawerHeader(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: AssetImage('assets/menu-img.jpg'),fit: BoxFit.cover)
      ),
      child: SizedBox(),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image
      //   )
      // ),
    );
  }
}