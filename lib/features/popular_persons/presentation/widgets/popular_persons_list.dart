import 'package:flutter/material.dart';
import 'package:movies_peaple/features/popular_persons/domain/entities/popular_person.dart';
import 'package:movies_peaple/features/popular_persons/presentation/widgets/popular_person_list_item.dart';

class PopularPersonsList extends StatelessWidget {
  final List<PopularPerson> popularPersons;

  const PopularPersonsList({Key? key, required this.popularPersons})
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
