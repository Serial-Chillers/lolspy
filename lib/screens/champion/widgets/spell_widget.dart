import 'package:flutter/material.dart';
import 'package:lolspy/models/spell.dart';

class SpellWidget extends StatelessWidget {
  final Spell spell;
  const SpellWidget({
    Key? key,
    required this.spell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(spell.name),
        Text(spell.description),
      ],
    );
  }
}
