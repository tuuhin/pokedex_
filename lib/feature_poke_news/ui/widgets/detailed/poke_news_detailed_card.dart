import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../main.dart';
import '../../../domain/domain.dart';

class PokeNewsDetailedCard extends StatefulWidget {
  final PokemonNewsModel news;
  const PokeNewsDetailedCard({Key? key, required this.news}) : super(key: key);

  @override
  State<PokeNewsDetailedCard> createState() => _PokeNewsDetailedCardState();
}

class _PokeNewsDetailedCardState extends State<PokeNewsDetailedCard> {
  void launchWebView() async {
    if (widget.news.url == null) return;
    try {
      Uri url = Uri.parse('https://api.pokemon.com/us/api${widget.news.url!}');
      if (await canLaunchUrl(url)) {
        launchUrl(url, mode: LaunchMode.externalApplication);
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
      logger.severe(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: GestureDetector(
            onTap: launchWebView,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: CachedNetworkImage(
                    imageUrl: widget.news.image!,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    placeholder: (context, url) => Container(
                      decoration: const BoxDecoration(color: Colors.black12),
                    ),
                    errorWidget: (context, url, error) => Container(
                      decoration: const BoxDecoration(color: Colors.black26),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(widget.news.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 4),
              if (widget.news.shortDescription != null)
                Text(
                  widget.news.shortDescription!,
                  style: TextStyle(
                      color: Theme.of(context).textTheme.caption?.color),
                ),
              const Divider(),
              Text(widget.news.date),
            ]),
          ),
        ),
      ),
    );
  }
}
