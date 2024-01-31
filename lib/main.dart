import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssmsapp1/presentation/home_screen.dart';
import 'package:ssmsapp1/presentation/master.dart';
import 'package:ssmsapp1/presentation/onboarding_screen.dart';
import 'package:ssmsapp1/presentation/signup_screen.dart';
import 'package:ssmsapp1/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ssmsapp1/resources/menu_method.dart';
import 'package:hive_flutter/hive_flutter.dart';


import 'package:ssmsapp1/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('local_menu');
  Hive.registerAdapter(MenuDataAdapter());





}

@HiveType(typeId: 1)
class MenuData {
  @HiveField(0)
  String dayOfWeek;

  @HiveField(1)
  String dateTime;

  // Add fields for other data items

  MenuData(this.dayOfWeek, this.dateTime);
}

// You need to create an adapter for the MenuData class
class MenuDataAdapter extends TypeAdapter<MenuData> {
  @override
  final int typeId = 1;

  @override
  MenuData read(BinaryReader reader) {
    return MenuData(
      reader.readString(),
      reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, MenuData obj) {
    writer.writeString(obj.dayOfWeek);
    writer.writeString(obj.dateTime);
  }
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ssmsapp1',
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              // Checking if the snapshot has any data or not
              if (snapshot.hasData && FirebaseAuth.instance.currentUser!.email!.toString().endsWith('@pilani.bits-pilani.ac.in')) {
                return MasterScreen();

              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }

            // means connection to future hasnt been made yet
            if (snapshot.connectionState == ConnectionState.waiting) {
              return OnboardingScreen();
            }

            return SignUpScreen();
          },
        ),
      ),
    );
    return MaterialApp(

      title: 'ssmsapp1',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onboardingScreen,
      routes: AppRoutes.routes,
    );
  }
}
