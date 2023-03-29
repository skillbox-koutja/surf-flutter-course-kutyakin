import 'package:places/domain/user_preferences/model.dart';

abstract class UserPreferencesRepository {
  Future<UserPreferencesModel> get(UserPreferencesModel defaultModel);

  void save(UserPreferencesModel model);
}
