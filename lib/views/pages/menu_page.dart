import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:imperio/config/app_navigation.dart';
import 'package:imperio/models/nav_item.dart';
import 'package:imperio/stores/login/login_store.dart';
import 'package:imperio/stores/navigation/navigation_store.dart';
import 'package:imperio/config/service_locator.dart';

class MenuPage extends StatelessWidget {
  final NavigationStore navigationStore = getIt<NavigationStore>();
  final LoginStore loginStore = getIt<LoginStore>();

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const Divider(),
          Expanded(child: _buildMenuList(context)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Observer(
        builder: (_) => Row(
          children: [
            Expanded(
              child: navigationStore.isSearchOpen
                  ? _buildSearchField(context)
                  : const Text(''),
            ),
            if (!navigationStore.isSearchOpen) ...[
              _searchButton(context),
              const SizedBox(width: 10),
              _helpSupportButton(context),
              _logoutButton(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(BuildContext context) {
    return TextField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Pesquisar...",
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: navigationStore.toggleSearch,
        ),
      ),
      onChanged: (value) {
        navigationStore.setSearchText(value);
      },
    );
  }

  Widget _searchButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7)),
      onPressed: navigationStore.toggleSearch,
    );
  }

  Widget _logoutButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.logout,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7)),
      onPressed: () {
        loginStore.logout();
        navigationStore.setSelectedItem('home');
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppNavigation.LOGIN,
          (Route<dynamic> route) => false,
        );
      },
    );
  }

  Widget _helpSupportButton(BuildContext context) {
    return TextButton.icon(
      icon: Icon(Icons.help_outline,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7)),
      label: const Text("Ajuda e suporte",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
      onPressed: () {},
    );
  }

  Widget _buildMenuList(BuildContext context) {
    final color = Theme.of(context).colorScheme.tertiary.withOpacity(0.7);

    return Observer(builder: (context) {
      final items = navigationStore.filteredItems;
      final itemCount = items.length;
      return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _buildMenuItem(items[index], color, index, context),
              _conditionalDivider(index, itemCount),
            ],
          );
        },
      );
    });
  }

  Widget _buildMenuItem(
      NavItem item, Color color, int index, BuildContext context) {
    return ListTile(
      leading: Icon(item.icon, size: 19, color: color),
      title: Text(item.label, style: TextStyle(color: color)),
      onTap: () {
        if (!item.tabBarItem) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => item.page));
          return;
        }
        navigationStore.setSelectedItem(item.id);
      },
    );
  }

  Widget _conditionalDivider(int index, int count) {
    return Observer(
      builder: (_) {
        if ((index == count - 3 || index == count - 1) &&
            !navigationStore.isSearchOpen) {
          return const Divider();
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
