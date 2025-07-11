abstract class CurrentPageSpUsecase {
  Future<void> saveCurrentPage(int page);
  Future<int> getCurrentPage();
  Future<void> clearCurrentPage();
}
