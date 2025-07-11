abstract class CurrentPageSpDatasource {
  Future<void> saveCurrentPage(int page);
  Future<int> getCurrentPage();
  Future<void> clearCurrentPage();
}
