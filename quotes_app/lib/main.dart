import 'package:flutter/material.dart';
import 'package:quotes_app/quote.dart';

// here, we will try to make custom widgets and classes. Why?
// See, in Flutter, we do have builtin widgets. But they are general ones.
// In our app, we may want to have specific widgets like ProductCard, OrderPreview, etc, so as to have code reusability, and maintainability
// Also, custom classes are needed to be able to better hold our data, like Product, Order, etc.

// here, we will try to make a quotes app
// also, we will try to include the functionality to add quotes

// first of all, we need a Quote class
// check quote.dart

// next, let's try to make a widget for quote

void main() {
  // runApp(const QuotesApp());

  runApp(MyApp());

  // runApp(MaterialApp(
  //   home: Scaffold(
  //     body: QuoteWidget(Quote(content: "This is a well quote. Thank you for reading.", author: "Sanket Gupta")),
  //   ),
  // ));

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Quotes",
      home: QuotesApp(),
    );
  }
}


class QuotesApp extends StatefulWidget {
  const QuotesApp({super.key});

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {

  // list of quotes is the state
  final List<Quote> quotes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quotes App"),
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(15),
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: quotes.map((quote)=>Container( height: 150,child: QuoteWidget(quote),)).toList(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            _showInputDialog(context);
          },
        ),
    );
  }

  // to show input dialog to add new quotes
  void _showInputDialog(BuildContext context)
  {
    // creating a form state, and getting its key
    final _formKey = GlobalKey<FormState>();

    // variables to bind the filed values to
    String content='';
    String author='';

    showDialog(
      context: context,
      builder: (context)
        {
          return AlertDialog(
            title: Text("Add Quote"),
            // will display a form in content
            content: Form(
              // to create a container for form fields
              key: _formKey,
              child: Column(
                children: [
                  // fields go here
                  TextFormField(
                    decoration: InputDecoration(labelText: "Content"),
                    validator: (contentText)
                    {
                      if((contentText==null)||contentText.isEmpty)
                        {
                          return "Enter content";
                        }
                      return null;
                    },
                    onSaved: (value)
                    {
                      // save in the field
                      content = value!;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Author"),
                    validator: (authorName)
                    {
                      if((authorName==null)||authorName.isEmpty)
                      {
                        return "Enter content";
                      }
                      return null;
                    },
                    onSaved: (value)
                    {
                      // save in the field
                      author = value!;
                    },
                  ),
                ],
              ),
            ),
            // specifying add and cancel buttons
            actions: [
              // cancel button
              TextButton(
                onPressed: ()
                {
                  // close the dialog box simply
                  Navigator.of(context).pop();
                },
                child: Text("Cancel"),
              ),
              // add button
              TextButton(
                onPressed: ()
                {
                  if(_formKey.currentState!.validate())
                    {
                      // valid
                      // save it
                      _formKey.currentState!.save();

                      // save in quotes
                      setState(() {
                        quotes.add(Quote(content: content, author: author));
                      });

                      // close this dialog
                      Navigator.of(context).pop();
                    }

                },
                child: Text("Add"),
              ),
            ],
          );
        }
    );
  }

}


class QuoteWidget extends StatelessWidget {

  final Quote quote;

  const QuoteWidget(this.quote, {super.key});

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
      child: Scaffold(
        body: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              Text(quote.content),
              Text(quote.author)
            ],
          ),
        ),
      ),
    );

  }
}
