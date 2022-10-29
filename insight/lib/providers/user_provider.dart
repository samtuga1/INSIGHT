import 'dart:math';

import 'package:flutter/material.dart';
import 'package:insight/consts/enums.dart';
import 'package:insight/models/pitch_model.dart';
import 'package:insight/models/user_model.dart';

class User extends ChangeNotifier {
  final UserModel _userModel = UserModel();

  List<PitchModel> _favPitches = [];
  List<PitchModel> get favPitches => _favPitches;

  List<PitchModel> _pitches = [];
  List<PitchModel> get pitches => _pitches;

  UserModel get user => _userModel;

  void setUserStatus(UserStatus userStatus) {
    _userModel.userStatus = userStatus;
  }

  void setUser(String email, String name) {
    _userModel.email = email;
    _userModel.name = name;
    notifyListeners();
  }

  addPitch(PitchModel pitch) {
    _pitches.add(pitch);
    notifyListeners();
  }

  addFavPitch(PitchModel favPitch) {
    _favPitches.add(favPitch);
    print(_favPitches.length);
    notifyListeners();
  }

  removeFavPitch(PitchModel pitch) {
    _favPitches.remove(pitch);
    notifyListeners();
  }
}
