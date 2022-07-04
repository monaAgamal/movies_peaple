import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_peaple/core/domain/entities/app_configuration.dart';
import 'package:movies_peaple/dependency_injection/di.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';
import 'package:movies_peaple/features/popular_persons/presentation/cubit/popular_persons_cubit.dart';
import 'package:movies_peaple/features/popular_persons/presentation/cubit/popular_persons_state.dart';
import '../../../person_details/presentation/pages/person_details_page.dart';

class PopularPersonsPage extends StatelessWidget {
  const PopularPersonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  late PopularPersonsCubit popularPersonsCubit;
  late final ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    popularPersonsCubit = getIt<PopularPersonsCubit>();
    popularPersonsCubit.fetchFirstPatchOfPopularPersons();
    scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(() {
        if (popularPersonsCubit.canLoadMore &&
            scrollController.position.pixels >=
                scrollController.position.maxScrollExtent) {
          popularPersonsCubit.loadMorePageOfPopularPeople();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPersonsCubit, PopularPersonsState>(
      bloc: popularPersonsCubit,
      buildWhen: (prev, current) =>
          current is PopularPersonsLoaded || current is Loading,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(
              child: CircularProgressIndicator(color: Colors.black)),
          popularPersonsLoaded: (data) => RefreshIndicator(
            color: Colors.black,
            onRefresh: () async {
              popularPersonsCubit.fetchFirstPatchOfPopularPersons();
            },
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  PopularPeopleList(popularPersons: data),
                  BlocBuilder<PopularPersonsCubit, PopularPersonsState>(
                    bloc: popularPersonsCubit,
                    buildWhen: (prev, current) => current is Paginating,
                    builder: (context, state) => state.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      paginating: () => const Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PopularPeopleList extends StatelessWidget {
  final List<PopularPerson> popularPersons;

  const PopularPeopleList({Key? key, required this.popularPersons})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(12),
      separatorBuilder: (_, index) => const Divider(),
      itemCount: popularPersons.length,
      itemBuilder: (_, index) => PopularPersonItem(
        person: popularPersons[index],
      ),
    );
  }
}

class PopularPersonItem extends StatelessWidget {
  final PopularPerson person;

  PopularPersonItem({super.key, required this.person});

  final imageConfiguration = getIt<AppConfiguration>();

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "${imageConfiguration.imageConfiguration.secureBaseUrl}${imageConfiguration.imageConfiguration.profileSizes.last}${person.profileImagePath}";
    log(imageUrl);
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
