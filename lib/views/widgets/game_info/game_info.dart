import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:imperio/views/widgets/game_info/info_column.dart';
import 'package:imperio/views/widgets/game_info/info_row.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:imperio/models/match/match.dart';
import 'package:imperio/views/widgets/shared/share_button.dart';
import 'package:intl/intl.dart';

class GameInfo extends StatelessWidget {
  final Match match;

  const GameInfo({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: 'Informações do jogo',
          textPosition: TextPosition.middle,
        ),
        InfoRow(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          start: _title('Premiere'),
          end: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.asset(
                  'assets/images/paramont.png',
                  width: 61,
                ),
              ),
              const SizedBox(width: 5),
              SizedBox(
                width: 150,
                child: _boldText(
                  match.channels,
                ),
              ),
              const SizedBox(width: 5),
              const ShareButton(),
            ],
          ),
        ),
        InfoRow(
          start: _title('Data'),
          end: _boldText(
            DateFormat('dd/MM/yyyy, HH:mm').format(match.date),
          ),
        ),
        InfoRow(
          start: _title('Estádio'),
          end: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _boldText(match.referee),
              Row(
                children: [
                  const Text(
                    'Capacidade',
                    style: TextStyle(fontSize: 10),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  _boldText('10,000')
                ],
              )
            ],
          ),
        ),
        InfoRow(
          start: InfoColumn(
            top: _title('Árbitro'),
            bottom: _boldText(match.referee),
          ),
          end: InfoColumn(
              top: _title('Média de cartões'),
              bottom: Row(
                children: [
                  _cardAverage(match.redCardMedia, Colors.red),
                  const SizedBox(
                    width: 10,
                  ),
                  _cardAverage(match.yellowCardMedia, Colors.yellow),
                ],
              )),
        ),
      ],
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
    );
  }

  Widget _boldText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _cardAverage(double average, Color color) {
    return Container(
      decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          Text(
            NumberFormat.compact().format(average),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            width: 5,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              color,
              BlendMode.srcIn,
            ),
            child: SvgPicture.asset('assets/images/sport_card.svg'),
          ),
        ],
      ),
    );
  }
}
