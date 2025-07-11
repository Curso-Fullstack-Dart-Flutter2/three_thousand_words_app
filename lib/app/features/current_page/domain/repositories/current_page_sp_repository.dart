abstract class CurrentPageSpRepository {
  Future<void> saveCurrentPage(int page);
  Future<int> getCurrentPage();
  Future<void> clearCurrentPage();
}
