import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/singletons/tags_remover.dart';
import '../../../../main.dart';
import '../../../data/news_data.dart';

class PokeNewsDetailedCard extends StatefulWidget {
  final PokeNewsDto news;
  const PokeNewsDetailedCard({Key? key, required this.news}) : super(key: key);

  @override
  State<PokeNewsDetailedCard> createState() => _PokeNewsDetailedCardState();
}

class _PokeNewsDetailedCardState extends State<PokeNewsDetailedCard> {
  void launchWebView() async {
    try {
      Uri url = Uri.parse('https://api.pokemon.com/us/api${widget.news.url!}');
      if (await canLaunchUrl(url)) {
        launchUrl(url, mode: LaunchMode.platformDefault);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Can\'t parse this url')));
      }
    } on PlatformException {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Failed'),
          content: Text('Platform dosen\'t supports opening url'),
        ),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('${e.runtimeType}'),
        ),
      );
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: double.infinity,
                height: size.height * .2,
                child: CachedNetworkImage(
                  imageUrl: widget.news.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(tagRemover(widget.news.title),
                style: Theme.of(context).textTheme.headline6),
            if (widget.news.shortDescription != null) ...[
              const SizedBox(height: 4),
              Text(tagRemover(widget.news.shortDescription!))
            ],
            const Divider(),
            Text(widget.news.date),
          ]
              // CachedNetworkImage(imageUrl: news.image!)],
              )),
    ));
  }
}
