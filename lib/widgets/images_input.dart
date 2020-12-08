import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: Text('Nenhuma Imagem!'),
        ),
        SizedBox(width: 10),
        Expanded(
          child: FlatButton.icon(
            onPressed: () {},
            icon: Icon(Icons.camera),
            label: Text('Tirar Foto'),
            textColor: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
