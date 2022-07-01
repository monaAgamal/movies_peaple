import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/entities/page.dart';
import 'dart:developer';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';
import 'package:movies_peaple/features/popular_persons/domain/use_cases/fetch_popular_persons_use_case.dart';
import 'package:movies_peaple/features/popular_persons/presentation/cubit/popular_persons_state.dart';

@injectable
class PopularPersonsCubit extends Cubit<PopularPersonsState> {
  final FetchPopularPersonsUseCase useCase;

  PopularPersonsCubit(this.useCase)
      : super(const PopularPersonsState.initial());

  int _currentPage = 1;

  int get currentPage => _currentPage;

  bool _canLoadMore = true;

  bool get canLoadMore => _canLoadMore;

  List<PopularPerson> popularPersonsData = [];

  fetchFirstPatchOfPopularPersons() {
    emit(const PopularPersonsState.loading());
    _fetchPopularPersons();
  }

  void loadMorePageOfPopularPeople() {
    emit(const PopularPersonsState.paginating());
    _fetchPopularPersons();
  }

  void _fetchPopularPersons() async {
    if (canLoadMore) {
      final result = await useCase(PageParams(_currentPage));
      result.fold((l) {
        emit(const PopularPersonsState.error(
            errorMessage: "Some thing went wrong pls try again"));
      }, (r) {
        log(r.isLastPage.toString());
        if (r.isLastPage) {
          _canLoadMore = false;
        }
        _currentPage++;
        popularPersonsData.addAll(r.data);
        emit(
          PopularPersonsState.popularPersonsLoaded(
            popularPersonsData: popularPersonsData,
          ),
        );
        return;
      });
    }
  }
}
