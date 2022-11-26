import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../main.dart';
import '../../../domain/domain.dart';

class PokeNewsSummary extends StatefulWidget {
  final PokemonNewsModel news;
  const PokeNewsSummary({Key? key, required this.news}) : super(key: key);

  @override
  State<PokeNewsSummary> createState() => _PokeNewsSummaryState();
}

class _PokeNewsSummaryState extends State<PokeNewsSummary>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    scale = Tween<double>(begin: 0.2, end: 1.0).animate(CurvedAnimation(
        parent: _controller, curve: Curves.fastLinearToSlowEaseIn));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _launchWebView() async {
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
      logger.severe(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) =>
          SizeTransition(sizeFactor: scale, child: child),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(10.0)),
            padding: const EdgeInsets.all(12.0),
            child: GestureDetector(
              onDoubleTap: _launchWebView,
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.news.title,
                            style:
                                const TextStyle(fontWeight: FontWeight.w400)),
                        const SizedBox(height: 5),
                        if (widget.news.shortDescription != null)
                          Text(
                            widget.news.shortDescription!,
                            style: Theme.of(context).textTheme.caption,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        const Divider(),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(widget.news.date,
                                style: Theme.of(context).textTheme.caption))
                      ],
                    ),
                  ),
                  const VerticalDivider(),
                  Flexible(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl: widget.news.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
