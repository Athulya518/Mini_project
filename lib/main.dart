
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:malabis/screens/splashscreen.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(

              iconTheme: IconThemeData(
                  color: Colors.black87
              )

          )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
