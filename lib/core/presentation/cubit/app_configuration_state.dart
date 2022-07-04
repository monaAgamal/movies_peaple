import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_configuration_state.freezed.dart';

@freezed
abstract class AppConfigurationState with _$AppConfigurationState {
  const factory AppConfigurationState.initial() = Initial;
  const factory AppConfigurationState.loading() = Loading;
  const factory AppConfigurationState.appConfigurationFetched() =
      AppConfigurationFetched;
  const factory AppConfigurationState.error({required String message}) = Error;

}
