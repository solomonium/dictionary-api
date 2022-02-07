import 'dart:ui';

import 'package:dictionary_app/Screens/detailed_page.dart';
import 'package:dictionary_app/bloc/dictionary_bloc.dart';
import 'package:dictionary_app/data/word_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  _DictionaryPageState createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  TextEditingController wordController = TextEditingController();
  DictionaryBloc dictionaryBloc = DictionaryBloc(repository: WordRepoImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.withRed(200),
      body: BlocBuilder<DictionaryBloc, DictionaryState>(
        builder: (context, state) {
          if (state is DictionaryLoading) {
            return buildLoading();
          } else if (state is DictionaryLoaded) {
            return DetailedPage(state.repository, wordController.text);
          } else if (state is DictionaryError) {
            return buildError(state.message);
          }
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Dictionary App',
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Search for your favorite Word',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                          //validator: (value) => value == null ? const Text('Please Input a word') : const Text('Success'),
                          controller: wordController,
                          decoration: const InputDecoration(
                              hintText:
                                  'Please enter a word to get the meaning',
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.italic),
                              labelText: 'Your Favorite word',
                              labelStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red))))),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.15,
                    child: ElevatedButton(
                      onPressed: () => BlocProvider.of<DictionaryBloc>(context)
                          .add(SearchMeaning(wordController.text)),
                      child: const Text(
                        'Search',
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildLoading() {
  return const Center(child: CircularProgressIndicator());
}

Widget buildError(String message) {
  return Center(child: Text(message));
}

// Widget buildLoaded() {
//   return const Center(child: DetailedPage(word: wordController.text,));
// }
