import 'package:flutter/cupertino.dart';

class StoreLocatorSegmentControl extends StatefulWidget {
  @override
  State createState() => _StoreLocatorSegmentControl();
}

class _StoreLocatorSegmentControl extends State<StoreLocatorSegmentControl> {
  final Map<int, Widget> children = const {
    0: Text('List'),
    1: Text('Map'),
  };

  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoSegmentedControl<int>(
        children: children,
        onValueChanged: (int newValue) {
          setState(() {
            currentValue = newValue;
          });
        },
        groupValue: currentValue,
      ),
    );
  }
}
