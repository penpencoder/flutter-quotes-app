import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> quotes = [
    "The best is yet to be.",
    "Try to be a rainbow in someone's cloud.",
    "Do good and good will come to you.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotes App'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(children: [
        Column(
          children: quotes
              .map((quote) => QuoteCard(quote, () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  }))
              .toList(),
        ),
      ]),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(label: Text('Quote')),
            textInputAction: TextInputAction.go,
            onSubmitted: (value) {
              setState(() {
                quotes.add(value);
                TextEditingController().clear();
              });
            },
          ),
        ),
      ),
    );
  }
}

class QuoteCard extends StatelessWidget {
  final String quote;
  final Function() delete;

  QuoteCard(this.quote, this.delete);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 10.0),
            child: Text(quote),
          ),
          TextButton(
            onPressed: delete,
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }
}
