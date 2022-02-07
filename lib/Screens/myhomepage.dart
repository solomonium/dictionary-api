// ignore_for_file: unnecessary_new

import 'dart:ui';

import 'package:dictionary_app/Screens/dictionary_page.dart';
import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({ Key? key }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

 //DictionaryBloc dictionaryBloc;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Dictionary App'), centerTitle: true,),
      body: BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
          return Container(
              color: Colors.purple,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/english_dict.png'),
                  ),
                  Center(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: InkWell(
                            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DictionaryPage(),),),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              height: 70.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.amber.shade200.withOpacity(0.5)
                              ),
                              child: Center(
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'PRESS ME',
                                      style: Theme.of(context).textTheme.headline5
                                    ),
                                    const Icon(Icons.arrow_forward_ios_sharp)
                                   
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
            ),
                ],
              ),
          );
        },
      ),);
    
  }
}