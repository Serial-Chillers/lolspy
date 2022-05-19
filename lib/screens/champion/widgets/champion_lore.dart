import 'package:flutter/material.dart';

class ChampionLore extends StatefulWidget {
  final String lore;
  final String blurd;
  const ChampionLore({
    Key? key,
    required this.lore,
    required this.blurd,
  }) : super(key: key);

  @override
  State<ChampionLore> createState() => _ChampionLoreState();
}

class _ChampionLoreState extends State<ChampionLore> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return _isExpanded
        ? Column(
            children: [
              Text(
                widget.lore,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: const Text('Rút gọn'))
            ],
          )
        : Column(
            children: [
              Text(
                widget.blurd,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: const Text('Xem thêm'))
            ],
          );
  }
}
