import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExpandStoreListTile extends StatelessWidget {
  ExpandStoreListTile({
    Key key,
    this.phoneNumber,
    this.storeHours,
  }) : super(key: key);

  final String phoneNumber;
  final String storeHours;

  _launchURL(String phoneNumber) async {
    var url = 'tel:' + phoneNumber;
    launch(url);
    /*if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }*/
  }

  List<Widget> getTextWidgets() {
    List<Widget> list = new List<Widget>();

    list.add(
      Divider(
        color: Colors.black,
      ),
    );
    list.add(SizedBox(height: 20));
    list.add(Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            _launchURL(phoneNumber);
          },
          color: Colors.blueAccent,
          child: Text(
            phoneNumber,
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blueAccent,
          child: Text(
            "DIRECTIONS",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.blueAccent,
          child: Text(
            "STORE MAP",
            style: const TextStyle(
              fontSize: 12.0,
              color: Colors.white,
            ),
          ),
        ),
      ],
    ));
    list.add(SizedBox(height: 20));

    list.add(Text(
      'STORE HOURS',
      maxLines: 1,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ));

    list.add(
      Divider(
        color: Colors.black,
      ),
    );
    list.add(SizedBox(height: 20));
    for (var i = 0; i < 7; i++) {
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Monday',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '9:00 AM to 10:00 AM',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
      list.add(SizedBox(height: 10));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getTextWidgets());
  }
}
