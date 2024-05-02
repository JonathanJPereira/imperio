import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/stores/sports_store.dart';
import 'package:imperio/utils/service_locator.dart';
import 'package:imperio/views/widgets/gradient_background.dart';
import 'package:imperio/views/widgets/upper_tab_bar.dart';
import 'package:imperio/views/widgets/upper_tab_button.dart';

class MainTabController extends StatefulWidget {
  const MainTabController({super.key});

  @override
  State<MainTabController> createState() => _MainTabControllerState();
}

class _MainTabControllerState extends State<MainTabController> {
  final SportsStore store = getIt<SportsStore>();

  @override
  void initState() {
    super.initState();
    store.fetchSports().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  PreferredSizeWidget buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(100.0),
      child: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/images/logo.svg',
          height: 25,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        bottom: UpperTabBar(tabs: buildTabs()),
      ),
    );
  }

  List<Widget> buildTabs() {
    return [
      const UpperTabButton(
          icon: IconData(0xe800, fontFamily: 'sport'), text: 'Todos'),
      ...store.sports
          .map((sport) =>
              UpperTabButton(icon: Icons.sports_soccer, text: sport.name))
          .toList()
    ];
  }

  Widget buildBody() {
    return Stack(
      children: [
        const GradientBackground(),
        TabBarView(
          children: [
            Center(
                child: Text(
                    'Todos os Esportes')), // Esta é a página para a aba "Todos"
            ...store.sports
                .map((sport) => Center(child: Text(sport.name)))
                .toList() // Uma página para cada esporte
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // Verifica se a lista de esportes está vazia
        if (store.sports.isEmpty) {
          // Retorna um widget de carregamento ou uma mensagem
          return Scaffold(
            appBar: AppBar(
              title: Text("Carregando esportes..."),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Center(
              child: CircularProgressIndicator(), // Widget de carregamento
            ),
          );
        }

        // Se a lista não estiver vazia, monta a tela normalmente
        return DefaultTabController(
          length: store.sports.length + 1, // Mais um para a aba "Todos"
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar(context),
            body: buildBody(),
          ),
        );
      },
    );
  }
}
