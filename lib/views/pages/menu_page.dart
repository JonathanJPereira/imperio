import 'package:flutter/material.dart';
import 'package:imperio/models/nav_item.dart';
import 'package:imperio/stores/navigation_store.dart';
import 'package:imperio/utils/service_locator.dart';

class MenuPage extends StatelessWidget {
  final NavigationStore store = getIt<NavigationStore>();

  MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          const Divider(color: Color(0xFFEFEFEF)),
          Expanded(child: _buildMenuList(context)),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      actions: <Widget>[
        _searchButton(context),
        const SizedBox(width: 10),
        _helpSupportButton(context),
        const SizedBox(width: 20),
      ],
    );
  }

  Widget _searchButton(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search,
          color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7)),
      onPressed: () {},
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
    final items = store.navItems;
    final itemCount = items.length;
    final color = Theme.of(context).colorScheme.tertiary.withOpacity(0.7);

    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Column(
          children: [
            _buildMenuItem(items[index], color, index),
            _conditionalDivider(index, itemCount),
          ],
        );
      },
    );
  }

  Widget _buildMenuItem(NavItem item, Color color, int index) {
    return ListTile(
      leading: Icon(item.icon, size: 19, color: color),
      title: Text(item.label, style: TextStyle(color: color)),
      onTap: () {
        store.setIndex(index);
      },
    );
  }

  Widget _conditionalDivider(int index, int count) {
    if (index == count - 3 || index == count - 1) {
      return const Divider(color: Color(0xFFEFEFEF));
    } else {
      return const SizedBox.shrink();
    }
  }
}
