import 'package:flutter/material.dart';
import 'package:greatPlaces/providers/greate_places.dart';
import 'package:greatPlaces/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Lugares'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              })
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatePlaces>(context, listen: false).loadPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatePlaces>(
                child: Center(
                  child: Text("Nenhum local cadastrado!"),
                ),
                builder: (ctx, greatePlaces, ch) => greatePlaces.itemsCount == 0
                    ? ch
                    : ListView.builder(
                        itemCount: greatePlaces.itemsCount,
                        itemBuilder: (ctx, index) => ListTile(
                          leading: CircleAvatar(
                            backgroundImage: FileImage(
                                greatePlaces.itemByIndex(index).image),
                          ),
                          title: Text(greatePlaces.itemByIndex(index).title),
                          subtitle: Text(
                            greatePlaces.itemByIndex(index).location.address,
                          ),
                          onTap: () {},
                        ),
                      ),
              ),
      ),
    );
  }
}
