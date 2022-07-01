import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/core/domain/use_case/app_configuration_use_case.dart';
import 'package:movies_peaple/core/domain/use_case/use_case.dart';
import 'package:movies_peaple/core/presentation/app_configuration_state.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import '';

@injectable
class AppConfigurationCubit extends Cubit<AppConfigurationState> {
  final AppConfigurationUseCase appConfigurationUseCase;

  AppConfigurationCubit(this.appConfigurationUseCase)
      : super(const AppConfigurationState.initial());

  void fetchAppConfiguration() async {
    emit(const AppConfigurationState.loading());
    final result = await appConfigurationUseCase(NoParams());
    result.fold(
      (l) {
        emit(const AppConfigurationState.error(
            message: "Some thing went wrong"));
        return;
      },
      (configuration) {
        getIt.registerSingleton<AppConfiguration>(configuration);
        emit(const AppConfigurationState.appConfigurationFetched());
        return;
      },
    );
  }
}
