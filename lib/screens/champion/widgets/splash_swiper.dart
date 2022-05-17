import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/models.dart';

class SplashSwiper extends StatelessWidget {
  final String id;
  final List<Skin?> skins;
  const SplashSwiper({
    Key? key,
    required this.id,
    required this.skins,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        controller: PageController(viewportFraction: 0.9),
        itemCount: skins.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  imageUrl:
                      'http://ddragon.leagueoflegends.com/cdn/img/champion/splash/${id}_${skins[index]!.num}.jpg',
                ),
                Container(
                  color: Colors.grey.shade900.withOpacity(0.3),
                  alignment: Alignment.center,
                  constraints: BoxConstraints.tight(
                    Size(MediaQuery.of(context).size.width * 0.9, 30),
                  ),
                  child: Text(
                    skins[index]!.name == 'default'
                        ? 'Mặc định'
                        : skins[index]!.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
