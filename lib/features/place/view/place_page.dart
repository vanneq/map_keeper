import 'package:flutter/cupertino.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: const Text(
          "My place",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        trailing: GestureDetector(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CupertinoColors.black,
            ),
            child: const Icon(
              CupertinoIcons.plus,
              color: CupertinoColors.white,
              size: 24,
            ),
          ),
        ),
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14, bottom: 20),
              child: _SearchField(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      padding: const EdgeInsets.symmetric(vertical: 14),
      placeholder: "Search place",
      prefix: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Icon(
          CupertinoIcons.search,
          size: 18,
          color: CupertinoColors.systemGrey2,
        ),
      ),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
