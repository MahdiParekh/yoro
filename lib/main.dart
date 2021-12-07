import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoro/Pages/Test.dart';
import 'package:yoro/stateManagement/providerstate.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>TestNotifier(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) =>  Test(),
        },
      ),
    );
  }
}

