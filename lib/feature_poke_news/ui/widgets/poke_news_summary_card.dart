import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_news/data/dto/pokenews_dto.dart';

class PokeNewsSummary extends StatelessWidget {
  final PokeNewsDto news;
  const PokeNewsSummary({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(news.title.replaceAll(RegExp(r'<.*?>'), ''),
                          style: const TextStyle(fontWeight: FontWeight.w700)),
                      const Spacer(),
                      const Divider(),
                      Text(news.date,
                          style: const TextStyle(fontWeight: FontWeight.w500)),
                    ]),
              ),
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: news.image!,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
