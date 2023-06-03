import 'package:coffee_with_crew/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/myuser.dart';
import 'package:coffee_with_crew/screens/home/home.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<MyUser?>(context);

    // return either Home or Authenticate widget
    if (user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}
