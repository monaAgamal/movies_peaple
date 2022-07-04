import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'package:movies_peaple/features/image_preview/presentation/pages/image_preview_page.dart';

import '../../../../core/domain/entities/app_configuration.dart';

class ImageGrid extends StatelessWidget {
  final List<String> personImagesPaths;
  final imageConfiguration = getIt<AppConfiguration>();

  ImageGrid({Key? key, required this.personImagesPaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 6,
        childAspectRatio: 0.75,
      ),
      itemCount: personImagesPaths.length,
      itemBuilder: (_, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => ImagePreviewPage(
                        imagePath:
                            "${imageConfiguration.imageConfiguration.secureBaseUrl}${imageConfiguration.imageConfiguration.profileSizes.last}${personImagesPaths[index]}",
                      )),
            );
          },
          child: CachedNetworkImage(
            imageUrl:
                "${imageConfiguration.imageConfiguration.secureBaseUrl}${imageConfiguration.imageConfiguration.profileSizes.last}${personImagesPaths[index]}",
            imageBuilder: (context, image) => Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    image: image,
                  )),
            ),
            placeholder: (context, url) => const Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
