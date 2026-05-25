import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavBar extends StatelessWidget {
  final Widget child;
  const NavBar({super.key, required this.child});

  static const tabs = ['/map', '/place'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = tabs.indexWhere((tab) {
      if (tab == '/') return location == '/map';
      return location.startsWith(tab);
    });
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: BottomAppBar(
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavItem(
                icon: CupertinoIcons.map,
                text: "Map",
                onTap: () => context.go(tabs[0]),
              ),
              NavItem(
                icon: CupertinoIcons.map_pin,
                text: "Place",
                onTap: () => context.go(tabs[1]),
              ),
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}

class NavItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const NavItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(children: [Icon(icon), SizedBox(height: 8), Text(text)]),
      ),
    );
  }
}
