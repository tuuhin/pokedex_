import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_news/data/dto/pokenews_dto.dart';
import 'package:flutter_pokedex/main.dart';
import 'package:url_launcher/url_launcher.dart';

class PokeNewsDetailedCard extends StatelessWidget {
  final PokeNewsDto news;
  const PokeNewsDetailedCard({super.key, required this.news});

  void launchWebView() async {
    try {
      if (await canLaunchUrl(
          Uri.parse('https://api.pokemon.com/us/api${news.url!}'))) {
        launchUrl(Uri.parse('https://api.pokemon.com${news.url!}'),
            mode: LaunchMode.inAppWebView);
      }
    } catch (e) {
      logger.severe(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: launchWebView,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: size.height * .2,
                child: CachedNetworkImage(
                  imageUrl: news.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              news.title.replaceAll(RegExp(r'<.*?>'), ''),
              style: Theme.of(context).textTheme.headline6,
            ),
            if (news.shortDescription != null) ...[
              const SizedBox(height: 8),
              Text(
                news.shortDescription!.replaceAll(RegExp(r'<.*?>'), ''),
              )
            ]
          ]
              // CachedNetworkImage(imageUrl: news.image!)],
              ),
        ),
      ),
    );
  }
}
