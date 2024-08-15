import 'package:flutter/material.dart';

class AddQuoteForm extends StatefulWidget {
  const AddQuoteForm({super.key, required this.addCallback, required this.cancelCallback});

  // callback to call when a quote is added
  final void Function({required String text, required String author}) addCallback;

  // callback to call when cancelled
  final VoidCallback cancelCallback;

  @override
  State<AddQuoteForm> createState() => _AddQuoteFormState();
}

class _AddQuoteFormState extends State<AddQuoteForm>
{

  // the key of the form
  // will allow validation
  final _formKey = GlobalKey<FormState>();

  // controllers to retrieve the entered values

  // controller for text field
  final textController = TextEditingController();

  // controller for author field
  final authorController = TextEditingController();

  // override thr dispose method so as to dispose each editing controller on dispose
  @override
  void dispose() {
    textController.dispose();
    authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(

      // associate key to the form
      key: _formKey,

      child: Column(

        children: <Widget>[

          // field for text
          TextFormField(

            // label
            decoration: const InputDecoration(labelText: "Text"),

            validator: (value)
            {
              if(value==null || value.isEmpty)
              {
                return "Please enter quote text";
              }
              return null;
            },

            // let's supply the controller
            controller: textController,
          ),

          // field for author
          TextFormField(
            decoration: const InputDecoration(labelText: "Author"),
            validator: (value)
            {
              if(value==null || value.isEmpty)
              {
                return "Please enter quote author";
              }
              return null;
            },

            // controller
            controller: authorController,
          ),

          // add and cancel buttons

          Row(

            children: [

              // add button
              TextButton
              (
                onPressed: ()
                {

                  // validate
                  if(_formKey.currentState!.validate())
                  {
                    // valid, so add
                    // use the text property of controller to retrieve the entered values
                    widget.addCallback(
                      text: textController.text,
                      author: authorController.text
                    );

                  }

                },

                child: const Text("Add"),

              ),

              // cancel button
              TextButton
              (
                onPressed: widget.cancelCallback,

                child: const Text("Cancel"),

              ),


            ],

          )

        ],

      )

    );
  }
}
