import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme_event.dart';
import 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleThemeEvent>(_onToggleTheme);
  }

  void _onToggleTheme(ToggleThemeEvent event, Emitter<ThemeState> emit) {
    final isCurrentlyDark = state.themeStatus == ThemeStatus.dark;
    emit(
      state.copyWith(
        themeStatus: isCurrentlyDark ? ThemeStatus.light : ThemeStatus.dark,
      ),
    );
  }
}
