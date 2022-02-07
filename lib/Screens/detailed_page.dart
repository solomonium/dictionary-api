import 'package:dictionary_app/Screens/dictionary_page.dart';
import 'package:dictionary_app/data/model.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatelessWidget {
  final String word;
  final WordResponse wordResponse;

  const DetailedPage(
    this.wordResponse,
    this.word, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meaning of your Favorite Word'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('SUCCESSFUL'),
            const SizedBox(height: 30),
            Card(
              color: Colors.indigoAccent,
              child: SizedBox(
                height: 100,
                width: 300,
                child: Center(
                    child: Text(word.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
            ),
            const SizedBox(height: 50),
            Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                    child: Text(
                  wordResponse.definition!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
              height: 200,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.15,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DictionaryPage())),
                child: const Text(
                  'Return to Search Page',
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
