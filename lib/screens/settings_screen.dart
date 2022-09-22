import 'package:flutter/material.dart';
import 'package:preferences_app/providers/theme_provider.dart';
import 'package:preferences_app/shared_preferences/preferences.dart';
import 'package:preferences_app/widgets/side_menu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  // bool isDarkMode = true;
  // int gender = 1;
  // String name = 'Jesús';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text('Ajuste',style: TextStyle(fontSize: 50, fontWeight: FontWeight.w300),)),
              const Divider(),
              SwitchListTile.adaptive(
                value: Preferences.isDarkMode, 
                title: const Text('Dark mode'),
                onChanged: (value){
                  Preferences.isDarkMode = value;
                  final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

                  value 
                    ? themeProvider.setDarkMode()
                    : themeProvider.setLightMode();
                  setState(() {});
                }
              ),
              const Divider(),
              RadioListTile<int>(
                title: const Text('Maculino'),
                value: 1, 
                groupValue: Preferences.gender, 
                onChanged: (value){
                  Preferences.gender = value ?? 1;
                  setState(() {});
                }
              ),
              RadioListTile<int>(
                title: const Text('Femenino'),
                value: 2, 
                groupValue: Preferences.gender, 
                onChanged: (value){
                  Preferences.gender = value ?? 2;
                  setState(() {});
                }
              ),
              const Divider(),
    
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  initialValue: Preferences.name,
                  onChanged: (value) {
                    Preferences.name = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    labelText: 'Nombre',
                    helperText: 'Nombre del usuario'
                  ),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}