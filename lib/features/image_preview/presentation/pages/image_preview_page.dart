import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'dart:developer';

import 'package:movies_peaple/features/image_preview/presentation/cubit/image_downloader_cubit.dart';
import 'package:movies_peaple/features/image_preview/presentation/cubit/image_downloader_state.dart';

class ImagePreviewPage extends StatelessWidget {
  final String imagePath;
  final ImageDownloaderCubit cubit = getIt<ImageDownloaderCubit>();

  ImagePreviewPage({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    log(imagePath);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
            child: BlocBuilder<ImageDownloaderCubit, ImageDownloaderState>(
              bloc: cubit,
              builder: (context, state) {
                return state.maybeWhen(
                  downloading: () => const SizedBox(
                    width: 54,
                    height: 54,
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                  orElse: () => GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                  ),
                );
              },
            ),
              ),
        ],
      ),
      body: Image.network(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
