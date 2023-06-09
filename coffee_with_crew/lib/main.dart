import 'package:coffee_with_crew/models/myuser.dart';
import 'package:coffee_with_crew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_with_crew/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:coffee_with_crew/models/myuser.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      catchError: (_, __) => null,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
