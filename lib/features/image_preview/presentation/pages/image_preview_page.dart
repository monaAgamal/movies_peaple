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
    return BlocListener<ImageDownloaderCubit, ImageDownloaderState>(
      listenWhen: (prev, current) => current is ImageDownloaded,
      bloc: cubit,
      listener: (_, state) => state.maybeWhen(
        orElse: () {},
        imageDownloaded: (isSuccessful) => showDialog(
          context: context,
          builder: (_) => AlertDialog(
            scrollable: false,
            contentPadding: EdgeInsets.zero,
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Image saved successfully'),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black),
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      child: Scaffold(
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
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: CircularProgressIndicator(color: Colors.black),
                      ),
                    ),
                    orElse: () => GestureDetector(
                      onTap: () {
                        cubit.saveDownloadableImageToLocal(imageUrl: imagePath);
                      },
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
      ),
    );
  }
}
