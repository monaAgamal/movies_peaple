class Page<T> {
  final List<T> data;

  final int pageNumber;

  final bool isLastPage;

  Page({
    required this.data,
    this.pageNumber = 1,
    this.isLastPage = false,
  });
}
