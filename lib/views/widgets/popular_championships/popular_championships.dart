import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/championships_store.dart';
import 'package:imperio/views/widgets/popular_championships/popular_championship_card.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PopularChampionships extends StatelessWidget {
  final ChampionshipsStore championshipsStore = GetIt.I<ChampionshipsStore>();

  PopularChampionships({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Campeonatos populares'),
        Observer(
          builder: (_) {
            if (championshipsStore.isLoading) {
              return const CircularProgressIndicator();
            } else {
              return HorizontalList(
                height: 80,
                itemDistance: 8,
                itemCount: championshipsStore.championships.length,
                itemBuilder: (context, index) {
                  final championship = championshipsStore.championships[index];
                  return PopularChampionshipCard(championship: championship);
                },
              );
            }
          },
        ),
      ],
    );
  }
}
