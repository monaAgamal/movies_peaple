import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'package:movies_peaple/features/person_details/presentation/pages/person_details_page.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';

class PopularPersonItem extends StatelessWidget {
  final PopularPerson person;

  PopularPersonItem({super.key, required this.person});

  final imageConfiguration = getIt<AppConfiguration>();

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "${imageConfiguration.imageConfiguration.secureBaseUrl}${imageConfiguration.imageConfiguration.profileSizes.last}${person.profileImagePath}";

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => PersonDetailsPage(
              personId: person.personId,
            ),
          ),
        );
      },
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            height: 45,
            width: 45,
            imageBuilder: (context, image) => CircleAvatar(
              backgroundImage: image,
              radius: 150,
            ),
            errorWidget: (_, __, ____) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(150),
              ),
              child: SvgPicture.asset('assets/svg/user.svg'),
            ),
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(person.personName),
              Text(person.originalCountry),
            ],
          ),
          const Expanded(child: SizedBox()),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
