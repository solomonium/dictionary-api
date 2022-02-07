import 'dart:async';
import 'package:dictionary_app/Screens/myhomepage.dart';
import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const MyHomePage(),
            ),),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent.shade400,
      body: BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) => 
          Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
      
                    const SizedBox(height: 30,),
                    Image.asset('assets/dict_logo.png'),
                    const CircularProgressIndicator(),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
            )
        ,
      ),
    );
  }
}