import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_peaple/core/presentation/cubit/app_configuration_state.dart';
import 'package:movies_peaple/core/presentation/widgets/app_configuration_loading_state.dart';
import 'package:movies_peaple/core/theme/app_theme.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'package:movies_peaple/features/popular_persons/presentation/pages/popular_persons_page.dart';

import 'core/presentation/cubit/app_configuration_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppConfigurationCubit configurationCubit;

  @override
  void initState() {
    super.initState();
    configurationCubit = getIt<AppConfigurationCubit>();
    configurationCubit.fetchAppConfiguration();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppConfigurationCubit, AppConfigurationState>(
      bloc: configurationCubit,
      buildWhen: (_, current) =>
          current is Loading || current is AppConfigurationFetched,
      builder: (context, state) {
        return MaterialApp(
          title: 'Movies People Viewer',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          home: state.maybeWhen(
            orElse: () => const LoadingConfigurationState(),
            appConfigurationFetched: () => const PopularPersonsPage(),
          ),
        );
      },
    );
  }
}

