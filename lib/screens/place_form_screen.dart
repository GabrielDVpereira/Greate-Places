import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatPlaces/providers/greate_places.dart';
import 'package:greatPlaces/widgets/images_input.dart';
import 'package:provider/provider.dart';

class PlaceFormScreen extends StatefulWidget {
  @override
  _PlaceFormScreenState createState() => _PlaceFormScreenState();
}

class _PlaceFormScreenState extends State<PlaceFormScreen> {
  final _titleController = TextEditingController();
  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _submitForm() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatePlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Lugar"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Título'),
                      controller: _titleController,
                    ),
                    SizedBox(height: 10),
                    ImageInput(this._selectImage)
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _submitForm,
            icon: Icon(Icons.add),
            label: Text('Adicionar'),
            color: Theme.of(context).accentColor,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          )
        ],
      ),
    );
  }
}
