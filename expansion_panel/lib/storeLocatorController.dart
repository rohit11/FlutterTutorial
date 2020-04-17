import 'package:expansion_panel/storeLocatorListView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'dart:async';
import 'package:google_maps_webservice/places.dart';

import 'googleMapView.dart';

class StoreLocatorController extends StatelessWidget {
  static const kGoogleApiKey = "AIzaSyCRpAy5sih8v6nkvHRg0mVRsrF1AMfPSBw";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async {
                  //_handlePressButton();
                  Prediction p = await PlacesAutocomplete.show(
                      context: context,
                      apiKey: kGoogleApiKey,
                      mode: Mode.overlay, // Mode.fullscreen
                      language: "en",
                      components: [new Component(Component.country, "en")]);
                },
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.list),
                ),
                Tab(icon: Icon(Icons.map)),
              ],
            ),
            title: Text('Store Locator'),
          ),
          body: TabBarView(
            children: [
              StoreLocatorListView(),
              GoogleMapView(),
            ],
          ),
        ),
      ),
    );
  }
}
