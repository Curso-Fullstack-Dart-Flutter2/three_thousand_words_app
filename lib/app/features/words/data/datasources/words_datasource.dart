import 'package:three_thousand_words/app/features/words/data/models/paginate_words_response_model.dart';

abstract class WordsDatasource {
  Future<PaginateWordsResponseModel> fetchWords({required int page, int limit = 20});
}
