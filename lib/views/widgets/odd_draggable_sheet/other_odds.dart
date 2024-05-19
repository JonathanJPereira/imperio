import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/views/widgets/game_info/info_row.dart';
import 'package:imperio/views/widgets/shared/share_button.dart';

class OtherOdds extends StatelessWidget {
  final Animation<Color?> colorAnimation;
  final String teamAName;

  const OtherOdds(
      {super.key, required this.colorAnimation, required this.teamAName});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: colorAnimation,
      builder: (context, child) {
        return Column(
          children: [
            _otherOddCard('assets/images/betting_houses/1xbet_promo.png'),
            _otherOddCard('assets/images/betting_houses/betsafe.png'),
            _otherOddCard('assets/images/betting_houses/betsson.png')
          ],
        );
      },
    );
  }

  Widget _otherOddCard(String imgAsset) {
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: colorAnimation.value,
      ),
      child: Column(
        children: [
          _buildHeader(imgAsset),
          _buildInfoRow(
            start: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTag('ODD MAIS ALTA'),
                const Text('Ambos times marcarão'),
              ],
            ),
            end: _boldText('5.2'),
          ),
          _buildInfoRow(
            start: Text('$teamAName marcará o primeiro gol'),
            end: _boldText('2.4'),
          ),
          _buildInfoRow(
            start: const Text('Mais de 4 Gols'),
            end: _boldText('3.2'),
            dividerColor: Colors.transparent,
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String imgAsset) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgAsset,
            width: 98,
          ),
          const ShareButton(),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 10,
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      {required Widget start, required Widget end, Color? dividerColor}) {
    return InfoRow(
      start: start,
      end: end,
      dividerColor: dividerColor ?? Colors.grey,
    );
  }

  Widget _boldText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    );
  }
}
