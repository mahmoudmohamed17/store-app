import 'package:hive_flutter/hive_flutter.dart';
part 'user_info_model.g.dart';


@HiveType(typeId: 1)
class UserInfoModel extends HiveObject {
  @HiveField(0)
  final String firstName;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final String email;

  UserInfoModel(
      {required this.firstName,
      required this.lastName,
      required this.password,
      required this.email});

  factory UserInfoModel.fromStore(store) {
    return UserInfoModel(
        firstName: store['first_name'],
        lastName: store['last_name'],
        password: store['password'],
        email: store['email']);
  }
}
