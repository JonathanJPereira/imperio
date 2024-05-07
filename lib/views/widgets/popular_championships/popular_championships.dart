import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/championships_store.dart';
import 'package:imperio/views/widgets/popular_championships/popular_championship_card.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';

class PopularChampionships extends StatefulWidget {
  const PopularChampionships({super.key});

  @override
  State<PopularChampionships> createState() => _PopularChampionshipsState();
}

class _PopularChampionshipsState extends State<PopularChampionships> {
  final ChampionshipsStore championshipsStore = GetIt.I<ChampionshipsStore>();

  @override
  void initState() {
    super.initState();
    championshipsStore.fetchChampionships();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Campeonatos populares'),
        HorizontalList(
          height: 80,
          itemDistance: 8,
          itemCount: 69,
          itemBuilder: (context, item) {
            return PopularChampionshipCard();
          },
        ),
      ],
    );
  }
}
