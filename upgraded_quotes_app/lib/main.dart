import 'package:flutter/material.dart';
import 'AddQuoteForm.dart';
import 'Quote.dart';
import 'QuoteCard.dart';

void main() {
  runApp
  (
    const MaterialApp
    (
      home: QuotesApp()
    )
  );
}

class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {

  // the state variable
  List<Quote> quotes = [
    Quote(text: 'The truth is realy pure and never simple',author:
    'jignesh1'),
    Quote(author: 'jignesh2', text: 'I see humans but no humanity'),
    Quote(text: 'The time is always right to do what is right',author:
    'jignesh3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (

        appBar: AppBar
        (
          title: const Text("Quotes App Upgraded"),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),

        body: SingleChildScrollView(
          child: Column
          (
            children: quotes.map((quote) => QuoteCard
            (
              quote: quote,
              delete: () {
                setState(() {
                  quotes.remove(quote);
                });
              },
            )).toList(),
          ),
        ),

        floatingActionButton: FloatingActionButton(

          // will show a popup form upon action button click

          onPressed: _showPopupForm,
          child: const Icon(Icons.add),
        ),

    );
  }

  void _showPopupForm()
  {
    // method to show a popup form for adding a new quote

    // context will say where the dialog is to be displayed with what theme
    showDialog(

        context: context,
        // builder will be used to actually build the dialog
        builder: (BuildContext context)
        {
          return AlertDialog
            (
              title: Text("Add Quote"),
              // will have a form in the content
              // will create a custom stateful form, so that the key isn't re created everytime
              content: SizedBox(

                height: 300,

                child: AddQuoteForm(
                  // handler to add a quote
                  addCallback: ({required String text, required String author})
                  {
                    // add in the state
                    setState(() {
                      quotes.add(Quote(text: text, author: author));
                    });

                    // close the dialog
                    Navigator.of(context).pop();
                  },

                  cancelCallback: ()
                  {
                    // close the dialog
                    Navigator.of(context).pop();
                  },

                ),
              )
            );
        }
    );

  }
}
