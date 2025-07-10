abstract class SharedPreferencesCore {
  Future<bool> setInt(String key, int value);
  Future<int?> getInt(String key);

  Future<bool> remove(String key);
  Future<void> clear();
}
