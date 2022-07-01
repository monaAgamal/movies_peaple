import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    popularPersonsCubit = getIt<PopularPersonsCubit>();
    popularPersonsCubit.fetchFirstPatchOfPopularPersons();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularPersonsCubit, PopularPersonsState>(
      bloc: popularPersonsCubit,
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const Center(child: CircularProgressIndicator()),
          popularPersonsLoaded: (data) =>
              PopularPeopleList(popularPersons: data),
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
      separatorBuilder: (_, index) => const Divider(),
      itemCount: popularPersons.length,
      itemBuilder: (_, __) => Container(),
    );
  }
}

class PopularPersonItem extends StatelessWidget {
  final PopularPerson person;

  const PopularPersonItem({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(person.profileImagePath),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(person.personName),
            Text(person.originalCountry),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const PersonDetailsPage(),
              ),
            );
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
