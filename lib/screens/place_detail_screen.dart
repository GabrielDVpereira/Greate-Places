import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatPlaces/models/place.dart';
import 'package:greatPlaces/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Place place = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(title: Text(place.title)),
        body: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                place.image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            SizedBox(height: 10),
            Text(
              place.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 10),
            FlatButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    fullscreenDialog: true,
                    builder: (ctx) => MapScreen(
                      isReadOnly: true,
                      initialLocation: place.location,
                    ),
                  ),
                );
              },
              icon: Icon(Icons.map),
              label: Text('Ver no mapa'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ));
  }
}
