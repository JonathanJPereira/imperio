import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/tips_store.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/views/widgets/tips_list/tip_card.dart';

class TipsList extends StatefulWidget {
  const TipsList({super.key});

  @override
  State<TipsList> createState() => _TipsListState();
}

class _TipsListState extends State<TipsList> {
  final TipsStore tipsStore = GetIt.I<TipsStore>();

  @override
  void initState() {
    super.initState();
    if (tipsStore.tips.isEmpty) {
      tipsStore.fetchTips();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          const SectionHeader(title: 'Dicas'),
          Observer(
            builder: (_) {
              if (tipsStore.tips.isEmpty) {
                return CircularProgressIndicator();
              }
              return HorizontalList(
                heigth: 300,
                itemDistance: 8,
                itemCount: tipsStore.tips.length,
                itemBuilder: (context, index) {
                  final tip = tipsStore.tips[index];
                  return TipCard(tip: tip);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
