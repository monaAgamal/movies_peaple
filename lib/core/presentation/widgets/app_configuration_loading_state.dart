import 'package:flutter/material.dart';

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
