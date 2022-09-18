import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/singletons/tags_remover.dart';
import '../../../data/news_data.dart';

class PokeNewsSummary extends StatelessWidget {
  final PokeNewsDto news;
  const PokeNewsSummary({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(children: [
                Flexible(
                    flex: 2,
                    child: Column(children: [
                      Text(tagRemover(news.title)),
                      const SizedBox(height: 4),
                      if (news.shortDescription != null) ...[
                        Text(tagRemover(news.shortDescription!),
                            style: Theme.of(context).textTheme.caption)
                      ]
                    ])),
                const VerticalDivider(),
                Flexible(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                            imageUrl: news.image!, fit: BoxFit.cover)))
              ]),
              const Divider(),
              Text(news.date,
                  style: const TextStyle(fontWeight: FontWeight.w500))
            ],
          ),
        ),
      );
}
