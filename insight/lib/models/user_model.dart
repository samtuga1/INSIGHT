import 'package:insight/consts/enums.dart';

class UserModel {
  String? name;
  UserStatus? userStatus;
  String? email;

  UserModel({
    this.email,
    this.name,
    this.userStatus = UserStatus.businessOwner,
  });
}
