import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../helpers/api_helpers/api_helpers.dart';
import '../../../models/models.dart';
import '../../screens.dart';

class ChampionWidget extends StatelessWidget {
  final Champion champion;
  const ChampionWidget({
    Key? key,
    required this.champion,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log(champion.id);
        Navigator.of(context).pushNamed(ChampionScreen.routeName,
            arguments: ChampionScreenArgs(id: champion.id));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        // height: 100,
        child: Column(children: [
          Expanded(
            child: CachedNetworkImage(
              imageUrl: ApiHelper.getImage(name: champion.id),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          // Image.network(ApiHelper.getImage(name: champion.id)),
          Text(champion.name)
        ]),
      ),
    );
  }
}
