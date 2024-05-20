import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/tips/tips_store.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/views/widgets/tips_list/tip_card.dart';

class TipsList extends StatelessWidget {
  final TipsStore tipsStore = GetIt.I<TipsStore>();

  TipsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Dicas'),
        Observer(
          builder: (_) {
            if (tipsStore.isLoading) {
              return const CircularProgressIndicator();
            } else if (tipsStore.errorMessage != null) {
              return Text(
                tipsStore.errorMessage!,
                style: const TextStyle(color: Colors.red),
              );
            } else if (tipsStore.tips.isEmpty) {
              return const Text('Nenhuma dica disponível.');
            } else {
              return HorizontalList(
                height: 300,
                itemDistance: 8,
                itemCount: tipsStore.tips.length,
                itemBuilder: (context, index) {
                  final tip = tipsStore.tips[index];
                  return TipCard(tip: tip);
                },
              );
            }
          },
        ),
      ],
    );
  }
}
