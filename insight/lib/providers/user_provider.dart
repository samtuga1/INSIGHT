import 'package:flutter/material.dart';
import 'package:insight/models/pitch_model.dart';
import 'package:insight/models/user_model.dart';

class User extends ChangeNotifier {
  final UserModel _userModel = UserModel();

  UserModel get user => _userModel;

  void setUserStatus(String userStatus) {
    _userModel.userStatus = userStatus;
  }

  void setUser(String email, String name) {
    _userModel.email = email;
    _userModel.name = name;
    notifyListeners();
  }

  addPitch(PitchModel pitch) {
    _userModel.pitches?.add(pitch);
    notifyListeners();
  }

  addFavPitch(PitchModel favPitch) {
    _userModel.favPitches?.add(favPitch);
    notifyListeners();
  }
}
