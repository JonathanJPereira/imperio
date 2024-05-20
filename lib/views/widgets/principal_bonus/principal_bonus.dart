import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/bonus_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/views/widgets/shared/action_prompt_row.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';

class PrincipalBonus extends StatelessWidget {
  final BonusStore bonusStore = GetIt.I<BonusStore>();

  PrincipalBonus({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Principais bônus de aposta'),
        Observer(
          builder: (_) {
            if (bonusStore.bonuses.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: bonusStore.bonuses.take(2).map((bonus) {
                return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 10),
                    padding: const EdgeInsets.all(8.0),
                    height: 84,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Image.asset(
                            'assets/images/stake.png',
                            width: 40.91,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(bonus.platform),
                              Text(bonus.discount),
                            ],
                          ),
                        )
                      ],
                    ));
              }).toList(),
            );
          },
        ),
        const ActionPromptRow(
          title: 'Veja mais bônus disponíveis',
        ),
      ],
    );
  }
}
