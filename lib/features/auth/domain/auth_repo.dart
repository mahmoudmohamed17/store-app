import 'package:store_app/features/auth/data/models/user_info_model.dart';

abstract class AuthRepo {
  Future<String> login({required String email, required String password});
  Future<String> register({
    required String email,
    required String password,
  });
  void storeUserData(
      {required String email,
      required String password,
      required String firstName,
      required String lastName});
  UserInfoModel getUserData({required String email});
}
