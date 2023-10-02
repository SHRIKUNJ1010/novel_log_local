import 'package:bloc/bloc.dart';
import 'package:novel_log_local/main.dart';
import 'package:novel_log_local/model/user_model.dart';
import 'package:novel_log_local/utility/secure_storage_utilty/secure_storage.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState(isBiometricOn: false)) {
    on<CheckUserAndManageNavigation>(_onCheckUserAndManageNavigation);
    on<ChangeCreateUserPin>(_onChangeCreateUserPin);
    on<ChangeCreateUserMasterPassword>(_onChangeCreateUserMasterPassword);
    on<ChangeBiometricOption>(_onChangeBiometricOption);
    on<DeleteUser>(_onDeleteUser);
  }

  Future<void> _onCheckUserAndManageNavigation(
    CheckUserAndManageNavigation event,
    Emitter<UserState> emit,
  ) async {
    String? tempMasterPassword = await SecureStorage.getMasterPassword();
    if (tempMasterPassword == null) {
      //todo: navigate to splash screen
    } else {
      //todo: navigate to home screen
    }
  }

  void _onChangeCreateUserPin(
    ChangeCreateUserPin event,
    Emitter<UserState> emit,
  ) {
    SecureStorage.setMobilePin(event.userPin);
  }

  void _onChangeCreateUserMasterPassword(
    ChangeCreateUserMasterPassword event,
    Emitter<UserState> emit,
  ) {
    SecureStorage.setMasterPassword(event.userMasterPassword);
  }

  Future<void> _onChangeBiometricOption(
    ChangeBiometricOption event,
    Emitter<UserState> emit,
  ) async {
    User? tempUser = await userBox.getUser();
    if (tempUser == null) {
      userBox.createUpdateUser(
        user: User(
          isBiometricOn: !state.isBiometricOn,
          id: '',
        ),
      );
    } else {
      userBox.createUpdateUser(
        user: User(
          id: tempUser.id,
          isBiometricOn: !state.isBiometricOn,
        ),
      );
    }
    emit(
      state.copyWith(
        isBiometricOn: !state.isBiometricOn,
      ),
    );
  }

  Future<void> _onDeleteUser(
    DeleteUser event,
    Emitter<UserState> emit,
  ) async {
    await userBox.deleteUser();
    emit(
      state.copyWith(
        isBiometricOn: false,
      ),
    );
    //todo: navigate back to splash screen
  }
}
