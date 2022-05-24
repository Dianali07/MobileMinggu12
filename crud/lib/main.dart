import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:crud/cubit/auth_cubit.dart';
import 'package:crud/cubit/student_cubit.dart';
import 'package:crud/page/add_student.dart';
import 'package:crud/page/home_page.dart';
import 'package:crud/page/sign_in_page.dart';
import 'package:crud/page/sign_up_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBbNU-_Ej3_wQt9Cvrfw7snCjJzlboZ0M8",
        appId: "1:564271834654:android:540f3c30350cd45589300f",
        messagingSenderId: "564271834654",
        projectId: "crud-ae1b2"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider<StudentCubit>(create: (context) => StudentCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SignUpPage(),
          '/sign-in': (context) => SignInPage(),
          '/home': (context) => HomePage(),
          '/add-student': (context) => AddStudent(),
        },
      ),
    );
  }
}
