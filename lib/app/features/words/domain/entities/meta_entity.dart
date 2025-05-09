class MetaEntity {
  final int totalCount;
  final int totalPages;
  final int currentPage;
  final int nextPage;

  const MetaEntity({
    required this.totalCount,
    required this.totalPages,
    required this.currentPage,
    required this.nextPage,
  });
}
