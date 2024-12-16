import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_app/constanst.dart';
import 'package:store_app/core/errors/auth_failure.dart';
import 'package:store_app/features/auth/data/models/user_info_model.dart';
import 'package:store_app/features/auth/domain/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final credential = FirebaseAuth.instance;
  @override
  Future<String> login(
      {required String email, required String password}) async {
    try {
      await credential.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return AuthFailure.catchError(e);
    } catch (e) {
      return 'Oops! There was an error';
    }
  }

  @override
  Future<String> register(
      {required String email, required String password}) async {
    try {
      await credential.createUserWithEmailAndPassword(
          email: email, password: password);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return AuthFailure.catchError(e);
    } catch (e) {
      return 'Oops! There was an error';
    }
  }

  @override
  UserInfoModel getUserData({required String email}) {
    var emailIdBox = Hive.box(kEmailIdBox);
    UserInfoModel userInfoModel;
    userInfoModel = emailIdBox.get(email);
    return userInfoModel;
  }

  @override
  void storeUserData(
      {required String email,
      required String password,
      required String firstName,
      required String lastName}) {
    UserInfoModel userInfoModel;
    userInfoModel = UserInfoModel(
        firstName: firstName,
        lastName: lastName,
        password: password,
        email: email);
    var emailIdBox = Hive.box(kEmailIdBox);
    emailIdBox.put(email, userInfoModel);
  }
}
