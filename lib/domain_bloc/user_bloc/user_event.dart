abstract class UserEvent {}

class CheckUserAndManageNavigation extends UserEvent {}

class ChangeCreateUserPin extends UserEvent {
  final String userPin;

  ChangeCreateUserPin({required this.userPin});
}

class ChangeCreateUserMasterPassword extends UserEvent {
  final String userMasterPassword;

  ChangeCreateUserMasterPassword({required this.userMasterPassword});
}

class ChangeBiometricOption extends UserEvent {}
