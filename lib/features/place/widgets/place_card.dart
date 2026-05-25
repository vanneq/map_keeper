import 'package:flutter/cupertino.dart';

class PlaceCard extends StatelessWidget {
  final String title;
  final String createAt;
  final VoidCallback onDeleteTap;

  const PlaceCard({
    super.key,
    required this.title,
    required this.createAt,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CupertinoColors.systemGrey5,
            ),
            child: const Icon(
              CupertinoIcons.map_pin,
              color: CupertinoColors.activeBlue,
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                createAt,
                style: TextStyle(color: CupertinoColors.systemGrey2),
              ),
            ],
          ),
          Spacer(),
          GestureDetector(
            onTap: onDeleteTap,
            child: Icon(CupertinoIcons.delete),
          ),
        ],
      ),
    );
  }
}
