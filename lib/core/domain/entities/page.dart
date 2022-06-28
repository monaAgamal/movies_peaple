import 'package:equatable/equatable.dart';

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

class PageParams extends Equatable {
  final int currentPage;

  const PageParams(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}
