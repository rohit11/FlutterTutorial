part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
 ThemeEvent([List props = const []]);
}

 class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  ThemeChanged( {
    @required this.theme
  }) : super([theme])


;

  @override
  // TODO: implement props
  List<Object> get props => null;}