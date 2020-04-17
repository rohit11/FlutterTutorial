import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/global/theme/bloc/theme_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
     child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: _buildWithTheme,
      ), create: (BuildContext context) => ThemeBloc(),
    );
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
      title: 'Material App',
      home: HomePage(),
      theme: state.themeData,
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to the PreferencePage
              /*Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Scaffold(),
              ));*/
            },
          )
        ],
      ),
      body: Center(
        child: Container(
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.display1,
          ),
        ),
      ),
    );
  }
}