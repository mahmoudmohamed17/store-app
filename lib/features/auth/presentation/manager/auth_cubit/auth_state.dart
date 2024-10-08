part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final String message;

  LoginSuccess({required this.message});
}

class LoginFailure extends AuthState {
  final String message;

  LoginFailure({required this.message});
}

class RegisterLoading extends AuthState {}

class RegisterSuccess extends AuthState {
  final String message;

  RegisterSuccess({required this.message});
}

class RegisterFailure extends AuthState {
  final String message;

  RegisterFailure({required this.message});
}
