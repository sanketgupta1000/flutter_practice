import 'package:flutter/material.dart';
import 'package:upgraded_quotes_app/Quote.dart';

// contains logic to display a card
class QuoteCard extends StatelessWidget
{
  const QuoteCard({super.key, required this.quote, required this.delete});

  // quote to display
  final Quote quote;
  // callback to call upon delete
  final VoidCallback delete;

  @override
  Widget build(BuildContext context)
  {
    return Card(
      margin: const EdgeInsets.fromLTRB(20.0, 30.0, 40.0, 10.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              quote.text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              quote.author,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8.0,),
            TextButton.icon(
              onPressed: delete,
              icon: const Icon(Icons.delete),
              label: const Text('Delete Quote'),
            ),
          ],
        ),
      ),
    );
  }
}
