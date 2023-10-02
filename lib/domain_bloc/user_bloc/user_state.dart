part of 'user_bloc.dart';

class UserState {
  final bool isBiometricOn;

  UserState({
    required this.isBiometricOn,
  });

  UserState copyWith({
    bool? isBiometricOn,
  }) {
    return UserState(
      isBiometricOn: isBiometricOn ?? this.isBiometricOn,
    );
  }
}
