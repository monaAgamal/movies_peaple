import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/features/popular_persons/presentation/cubit/popular_persons_state.dart';

@injectable
class PopularPersonsCubit extends Cubit<PopularPersonsState> {
  PopularPersonsCubit() : super(const PopularPersonsState.initial());



}
