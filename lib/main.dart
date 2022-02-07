import 'package:dictionary_app/Screens/splash_screen.dart';
import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/data/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DictionaryBloc(repository: WordRepoImpl()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            
            primarySwatch: Colors.blue,
          ),
          home:  const SplashScreen(),
        ),
    );
  }
}
