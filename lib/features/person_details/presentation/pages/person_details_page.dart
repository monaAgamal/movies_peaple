import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/features/person_details/domain/entities/person_details.dart';
import 'package:movies_peaple/features/person_details/presentation/cubit/person_details_cubit.dart';
import 'package:movies_peaple/features/person_details/presentation/cubit/person_details_state.dart';
import 'package:movies_peaple/features/person_details/presentation/widgets/person_images.dart';

import '../../../../dependency_injection/di.dart';
import 'dart:developer';

class PersonDetailsPage extends StatefulWidget {
  final int personId;

  const PersonDetailsPage({Key? key, required this.personId}) : super(key: key);

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {
  late final PersonDetailsCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<PersonDetailsCubit>();
    cubit.fetchPersonDetails(personId: widget.personId);
    cubit.fetchPersonImages(personId: widget.personId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
        bloc: cubit,
        buildWhen: (prev, current) => current is PersonDetailsFetched,
        builder: (context, state) {
          return state.maybeWhen(
            personDetailsFetched: (details) => BlocProvider(
              create: (context) => cubit,
              child: _Body(personDetails: details),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final PersonDetails personDetails;

  _Body({super.key, required this.personDetails});

  final imageConfiguration = getIt<AppConfiguration>();
  final dateFormatter = DateFormat("dd-MM-yyyy");

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "${imageConfiguration.imageConfiguration.secureBaseUrl}${imageConfiguration.imageConfiguration.profileSizes.last}${personDetails.profilePath}";

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: imageUrl,
              imageBuilder: (context, image) => CircleAvatar(
                backgroundImage: image,
                radius: 80,
              ),
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "${personDetails.name}\n${dateFormatter.format(personDetails.birthday)}\n${personDetails.placeOfBirth}",
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(personDetails.biography),
            const SizedBox(height: 12),
            Text(personDetails.biography),
            const SizedBox(height: 18),
            BlocBuilder<PersonDetailsCubit, PersonDetailsState>(
              builder: (context, state) {
                return state.maybeWhen(
                  personImagesFetched: (images) => ImageGrid(
                    personImagesPaths: images,
                  ),
                  orElse: () => const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
