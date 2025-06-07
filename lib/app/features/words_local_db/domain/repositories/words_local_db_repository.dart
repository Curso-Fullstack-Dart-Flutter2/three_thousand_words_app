abstract class WordsLocalDbRepository {
  Future<void> addWord(String word, String pronunciation, String meaning);
  Future<List<String>> getAllWords();
}
