import 'package:bloc/bloc.dart';
import 'package:store_app/features/auth/domain/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  AuthRepo authRepo;
  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());
    String result = await authRepo.login(email: email, password: password);
    if (result == 'Success') {
      emit(LoginSuccess(message: 'Login successfully!'));
    } else {
      emit(LoginFailure(message: result));
    }
  }

  Future<void> register(
      {required String email, required String password}) async {
    emit(RegisterLoading());
    String result = await authRepo.register(email: email, password: password);
    if (result == 'Success') {
      emit(RegisterSuccess(message: 'Account created successfully!'));
    } else {
      emit(RegisterFailure(message: result));
    }
  }
}
