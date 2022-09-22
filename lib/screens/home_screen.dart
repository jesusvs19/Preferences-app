import 'package:flutter/material.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'home';


  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DarkMode: ${Preferences.isDarkMode}',style: TextStyle(fontSize: 20),),
            Divider(),
            Text('Masculino: ' + (Preferences.gender == 1 ?'Si':'No'),style: TextStyle(fontSize: 20),),
            Divider(),
            Text('Nombre: ${Preferences.name}',style: TextStyle(fontSize: 20),),
            Divider(),
            
          ],
        )
      ),
    );
  }
}