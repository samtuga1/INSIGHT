import 'package:flutter/material.dart';
import 'package:insight/models/category_model.dart';
import 'package:insight/models/pitch_model.dart';

class PitchesProvider extends ChangeNotifier {
  final List<PitchModel> _pitches = [
    PitchModel(
      id: 'p1',
      howPreviousMoneySpent: 'I used the money for advertisement',
      imageUrl: 'assets/images/test.png',
      category: CategoryModel(
        imageUrl: 'assets/images/houses.png',
        title: 'Real Estate',
      ),
      description:
          'If you are knowledgeable and passionate about a specific topic (like business, social media, marketing, human resources, leadership or communication), consulting can be a lucrative option. You can start a consulting business on your own, then grow your business and hire other consultants over time.',
      estimatedAmount: 2422,
      title: 'Solving Drainage system',
    ),
    PitchModel(
      id: 'p2',
      howPreviousMoneySpent: 'I used the money for advertisement',
      imageUrl: 'assets/images/school.jpg',
      category: CategoryModel(
        imageUrl: 'assets/images/electronics.png',
        title: 'Electronics',
      ),
      description:
          'The demand for online education has opened up possibilities for entrepreneurs. Since this is an online venture, you can choose any subject you know about and teach a course regardless of location. If you don’t have advanced knowledge in any particular subject, consider teaching English as a foreign language online to students overseas.',
      estimatedAmount: 2422,
      title: 'Improving the online system of learning',
    ),
    PitchModel(
      id: 'p3',
      howPreviousMoneySpent: 'I used the money for advertisement',
      imageUrl: 'assets/images/healthcare.png',
      category: CategoryModel(
        imageUrl: 'assets/images/health.png',
        title: 'Health',
      ),
      description:
          'If you have a reliable vehicle and good time management skills, consider creating your own courier service – more specifically, a medical courier service. As a driver, you would be responsible for transporting medical items like lab specimens, prescription drugs and equipment. You could start your courier business on your own or hire other drivers to work for you.',
      estimatedAmount: 2422,
      title: 'Providing better medical sevices',
    ),
  ];
  List<PitchModel> get pitches => _pitches;

  addPitch(PitchModel pitch) {
    _pitches.add(pitch);
    notifyListeners();
  }

  PitchModel findById(id) {
    return _pitches.firstWhere((pitch) => pitch.id == id);
  }
}
