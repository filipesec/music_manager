import 'package:equatable/equatable.dart';

enum ThemeStatus { light, dark }

class ThemeState extends Equatable {
  final ThemeStatus themeStatus;

  const ThemeState({required this.themeStatus});

  factory ThemeState.initial() {
    return const ThemeState(themeStatus: ThemeStatus.light);
  }

  bool get isDarkMode => themeStatus == ThemeStatus.dark;

  ThemeState copyWith({ThemeStatus? themeStatus}) {
    return ThemeState(themeStatus: themeStatus ?? this.themeStatus);
  }

  @override
  List<Object?> get props => [themeStatus];
}
