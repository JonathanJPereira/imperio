import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/models/sport/sport.dart';
import 'package:imperio/stores/sports/sports_store.dart';
import 'package:imperio/utils/capitalize_first_of_each.dart';
import 'package:imperio/config/service_locator.dart';
import 'package:imperio/views/widgets/shared/gradient_background.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class SportsPage extends HookWidget {
  final SportsStore store = getIt<SportsStore>();

  SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      return () => store.setFilter('');
    }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Esportes'),
        centerTitle: false,
      ),
      body: Stack(
        children: [
          const GradientBackground(height: 100),
          SportsGrid(store: store),
        ],
      ),
    );
  }
}

class SportsGrid extends StatelessWidget {
  final SportsStore store;

  const SportsGrid({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchField(onChange: store.setFilter),
        Expanded(child: SportsList(store: store)),
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  final Function(String) onChange;

  const SearchField({super.key, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: Color(0xFF484848)),
          labelText: 'Pesquisar...',
          labelStyle: const TextStyle(color: Color(0xFFC0C4C2), fontSize: 12),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF1F1F1), width: 1.0),
            borderRadius: BorderRadius.circular(48.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF1F1F1), width: 1.0),
            borderRadius: BorderRadius.circular(48.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: onChange,
      ),
    );
  }
}

class SportsList extends StatelessWidget {
  final SportsStore store;

  const SportsList({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 157,
            childAspectRatio: 4 / 4.5,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: [
            ...store.filteredSports.map(
              (sport) => SportCard(sport: sport),
            )
          ],
        ),
      );
    });
  }
}

class SportCard extends StatelessWidget {
  final Sport sport;

  const SportCard({super.key, required this.sport});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF2EED4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomNetworkImage(imgUrl: sport.image),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  capitalizeFirstOfEach(sport.name),
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context)
                        .colorScheme
                        .tertiary
                        .withOpacity(0.55),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
