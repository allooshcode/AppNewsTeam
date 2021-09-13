import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/business_logic/cubit/theme_cubit/theme_states.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(InitialThemeState());

  bool isDark = false;

  changeThemeMode() {
    isDark = !isDark;
    emit(ThemeStateLoaded());
  }
}
