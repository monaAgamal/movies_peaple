import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_peaple/core/presentation/app_configuration_state.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'package:movies_peaple/features/popular_persons/presentation/pages/popular_persons_page.dart';

import 'core/presentation/app_configuration_cubit.dart';

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
      /// this logic should be in landing page /// to check onine/offline mode
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,
            accentColor: Colors.black,
            colorScheme: const ColorScheme(
              onError: Colors.white,
              onBackground: Colors.black,
              background: Colors.white,
              brightness: Brightness.light,
              error: Colors.red,
              surface: Colors.white,
              onSurface: Colors.black,
              onSecondary: Colors.white,
              onPrimary: Colors.black,
              primary: Colors.white,
              secondary: Colors.black,
            ),
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
            ),
          ),
          home: state.maybeWhen(
            orElse: () => const LoadingConfigurationState(),
            appConfigurationFetched: () => const PopularPersonsPage(),
          ),
        );
      },
    );
  }
}

class LoadingConfigurationState extends StatelessWidget {
  const LoadingConfigurationState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
