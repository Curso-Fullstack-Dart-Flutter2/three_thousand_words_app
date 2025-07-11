import 'package:three_thousand_words/app/features/current_page/domain/repositories/current_page_sp_repository.dart';
import 'package:three_thousand_words/app/features/current_page/domain/usecases/current_page_sp_usecase.dart';

class CurrentPageSpUsecaseImpl implements CurrentPageSpUsecase {
  final CurrentPageSpRepository _currentPageSpRepository;

  CurrentPageSpUsecaseImpl(
      {required CurrentPageSpRepository currentPageSpRepository})
      : _currentPageSpRepository = currentPageSpRepository;

  @override
  Future<void> saveCurrentPage(int page) async {
    if (page < 0) {
      throw ArgumentError('Page number cannot be negative');
    }

    return await _currentPageSpRepository.saveCurrentPage(page);
  }

  @override
  Future<int> getCurrentPage() async {
    final result = await _currentPageSpRepository.getCurrentPage();
    return result;
  }

  @override
  Future<void> clearCurrentPage() async {
    return await _currentPageSpRepository.clearCurrentPage();
  }
}
