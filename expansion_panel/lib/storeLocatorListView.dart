import 'package:expansion_panel/storeLocatorSegmentControl.dart';
import 'package:flutter/material.dart';
import 'storeListTile.dart';
import 'expandStoreListTile.dart';

/// This Widget is the main application widget.
class StoreLocatorListView extends StatelessWidget {
  static const String _title = 'Store Locator';

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: SingleChildScrollView(
          child: Container(
            child: _buildPanel(),
          ),
        )),
      ],
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return CustomListItemTwo(
              thumbnail: Image.asset(
                'assets/kohls_store.png',
                //fit:BoxFit.fill
                width: 100,
              ),
              title: 'Flutter 1.0 Launch',
              subtitle: 'Flutter continues to improve and expand its horizons.'
                  'This text should max out at two lines and clip',
              readDuration: '5 mins',
            );
          },
          body: ExpandStoreListTile(
            phoneNumber: '+19735191306',
            storeHours: 'Flutter continues to improve and expand its horizons.'
                'This text should max out at two lines and clip',
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
