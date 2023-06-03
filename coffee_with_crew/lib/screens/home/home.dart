import 'package:coffee_with_crew/screens/home/settings_form.dart';
import 'package:coffee_with_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_with_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:coffee_with_crew/screens/home/brew_list.dart';
import 'package:coffee_with_crew/models/brew.dart';
import 'package:flutter/src/material/colors.dart';


class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: SettingsForm(),
        );
      });
    }


    return StreamProvider<List<Brew>>.value(
      initialData: [],
      value: DatabaseService(uid: '').brews,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Coffee with Crew'),
          backgroundColor: Colors.brown[400],
           actions: [
             ElevatedButton.icon(
               icon: Icon(Icons.person),
               label: Text('logout'),
               onPressed: () async {
                 await _auth.signOut();
               },
               style: ElevatedButton.styleFrom(
                 backgroundColor: Colors.brown[400],
               ),
             ),
            ElevatedButton.icon(
                icon: Icon(Icons.settings),
                label: Text('settings'),
                onPressed: () => _showSettingsPanel(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown[400],
              ),
            )
           ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
            child: BrewList(),

        ),
      ),
    );
  }
}
