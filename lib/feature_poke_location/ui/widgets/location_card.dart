import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../main.dart';
import '../../data/util/location_mapper.dart';
import '../../domain/domain.dart';

class LocationCard extends StatefulWidget {
  final LocationModel model;
  const LocationCard({Key? key, required this.model}) : super(key: key);

  @override
  State<LocationCard> createState() => _LocationCardState();
}

class _LocationCardState extends State<LocationCard> {
  int? get _extraCount => widget.model.locations.length > 10
      ? widget.model.locations.length - 10
      : null;

  int get _sublistRange =>
      widget.model.locations.length > 10 ? 10 : widget.model.locations.length;

  void _openLink(String? url) async {
    if (url == null) return;
    try {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        launchUrl(uri, mode: LaunchMode.externalApplication);
        return;
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Cannot launch the url')));
    } on PlatformException {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Platform exception ')));
      logger.severe('Platform exception');
    } catch (e) {
      logger.severe(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    LocationMapper mapper = LocationMapper.getData(widget.model.regionName);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onDoubleTap: () => _openLink(mapper.url),
        child: Container(
          decoration: BoxDecoration(
            color: mapper.color,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: mapper.color.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(1, 1))
            ],
          ),
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (mapper.imgUrl != null)
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: mapper.imgUrl!,
                      height: 200,
                      width: 120,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                          height: 200,
                          width: 120,
                          decoration:
                              const BoxDecoration(color: Colors.black12)),
                    ),
                  ),
                )
              else
                const SizedBox(height: 200, width: 120),
              const VerticalDivider(),
              Flexible(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.model.regionName,
                      style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const Divider(height: 4, color: Colors.white),
                    Text(widget.model.gen ?? 'Unknown'),
                    if (widget.model.locations.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text('Locations',
                          style: Theme.of(context).textTheme.subtitle1),
                    ],
                    Wrap(
                      children: widget.model.locations
                          .sublist(0, _sublistRange)
                          .map<Widget>((e) => Padding(
                                padding: const EdgeInsets.all(2),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: Colors.black38)),
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ))
                          .toList()
                        ..add(
                          _sublistRange == 10
                              ? Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black38)),
                                    padding: const EdgeInsets.all(4),
                                    child: Text(
                                      '$_extraCount + more ',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
