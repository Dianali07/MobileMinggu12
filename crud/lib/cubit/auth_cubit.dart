import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:crud/models/user_model.dart';
import 'package:crud/services/auth_service.dart';
import 'package:crud/services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signUp(
        username: username,
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      emit(AuthLoading());
      UserModel user = await UserService().getCurrentUser(id);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
