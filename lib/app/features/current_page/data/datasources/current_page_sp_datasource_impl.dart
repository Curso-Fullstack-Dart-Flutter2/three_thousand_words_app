import 'package:three_thousand_words/app/core/shared_preferences/shared_preferences_core.dart';
import 'package:three_thousand_words/app/features/current_page/data/datasources/current_page_sp_datasource.dart';

class CurrentPageSpDatasourceImpl implements CurrentPageSpDatasource {
  final SharedPreferencesCore _sharedPreferencesCore;

  CurrentPageSpDatasourceImpl({required SharedPreferencesCore sharedPreferencesCore})
      : _sharedPreferencesCore = sharedPreferencesCore;

  @override
  Future<void> saveCurrentPage(int page) async {
    await _sharedPreferencesCore.setInt('current_page', page);
  }

  @override
  Future<int> getCurrentPage() async {
    final currentPage = await _sharedPreferencesCore.getInt('current_page');
    return currentPage ?? 0;
  }
  
  @override
  Future<void> clearCurrentPage() {
    return _sharedPreferencesCore.remove('current_page');
  }
}
