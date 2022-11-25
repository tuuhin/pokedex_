import 'package:flutter_pokedex/core/util/utlis.dart';

List<String> getUniqueSet(Iterable<String> locaitons) {
  Set<String> uniqueSet = {};
  for (final String element in locaitons) {
    uniqueSet.add(
        element.replaceAll(RegExp(r'[0-9]'), '').toTitleCase().removeDash());
  }
  return uniqueSet.toList();
}
