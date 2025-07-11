import 'package:three_thousand_words/app/features/current_page/data/datasources/current_page_sp_datasource.dart';
import 'package:three_thousand_words/app/features/current_page/domain/repositories/current_page_sp_repository.dart';

class CurrentPageSpRepositoryImpl implements CurrentPageSpRepository {
  final CurrentPageSpDatasource _currentPageSpDatasource;

  CurrentPageSpRepositoryImpl(
      {required CurrentPageSpDatasource currentPageSpDatasource})
      : _currentPageSpDatasource = currentPageSpDatasource;

  @override
  Future<void> saveCurrentPage(int page) async {
    await _currentPageSpDatasource.saveCurrentPage(page);
  }

  @override
  Future<int> getCurrentPage() async {
    final result = await _currentPageSpDatasource.getCurrentPage();
    return result;
  }

  @override
  Future<void> clearCurrentPage() async {
    await _currentPageSpDatasource.clearCurrentPage();
  }
}
