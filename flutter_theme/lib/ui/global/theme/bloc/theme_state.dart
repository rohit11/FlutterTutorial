part of 'theme_bloc.dart';

abstract class ThemeState extends Equatable {

  final ThemeData themeData;

  ThemeState({
    @required this.themeData,
  });

  //const ThemeState();
}

class ThemeInitial extends ThemeState {
  @override
  List<Object> get props => [];
  final ThemeData themeData;

  ThemeInitial({
    @required this.themeData,
  });

}
