import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/local_notification_services.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_application_1/features/home/presentation/screens/home_screen.dart';
import 'package:flutter_application_1/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'service_locator.dart' as di;

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await LocalNotificationServices.start();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      if (!LocalNotificationServices.notificationsEnabled) {
        await LocalNotificationServices.requestPermission();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeBloc>(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
