import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/feature_poke_location/data/util/location_mapper.dart';
import 'package:flutter_pokedex/feature_poke_location/domain/domain.dart';

class LocationCard extends StatelessWidget {
  final LocationModel model;
  const LocationCard({Key? key, required this.model}) : super(key: key);

  int? get _extraCount =>
      model.locations.length > 10 ? model.locations.length - 10 : null;

  int get _sublistRange =>
      model.locations.length > 10 ? 10 : model.locations.length;

  @override
  Widget build(BuildContext context) {
    LocationMapper mapper = LocationMapper.getData(model.regionName);

    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                    model.regionName,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const Divider(height: 4),
                  Text(model.gen ?? 'Unknown'),
                  if (model.locations.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Text('Locations',
                        style: Theme.of(context).textTheme.subtitle1),
                  ],
                  Wrap(
                    children: model.locations
                        .sublist(0, _sublistRange)
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.black38)),
                                padding: const EdgeInsets.all(4),
                                child: Text(
                                  e,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                            : const Padding(
                                padding: EdgeInsets.zero,
                                child: SizedBox.shrink(),
                              ),
                      ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
