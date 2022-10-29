import 'package:insight/consts/enums.dart';
import 'package:insight/models/pitch_model.dart';

class UserModel {
  String? name;
  UserStatus? userStatus;
  String? email;
  List<PitchModel>? pitches;
  List<PitchModel>? favPitches;
}
