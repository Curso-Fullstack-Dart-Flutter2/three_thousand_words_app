import 'package:shared_preferences/shared_preferences.dart';
import 'package:three_thousand_words/app/core/shared_preferences/shared_preferences_core.dart';

class SharedPreferencesCoreImpl implements SharedPreferencesCore {
  final SharedPreferences _sharedPreferences;

  SharedPreferencesCoreImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<int?> getInt(String key) async {
    return _sharedPreferences.getInt(key);
  }

  @override
  Future<bool> setInt(String key, int value) {
    return _sharedPreferences.setInt(key, value);
  }

  @override
  Future<bool> remove(String key) {
    return _sharedPreferences.remove(key);
  }

  @override
  Future<void> clear() {
    return _sharedPreferences.clear();
  }
}
