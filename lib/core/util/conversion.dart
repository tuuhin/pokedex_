String toMeters(int value) => '${(value / 10).toStringAsFixed(1)}m';

String toFeet(int value) => "${(value / 3.28).toStringAsFixed(1)}'";

String toKg(int value) => '${(0.1 * value).toStringAsFixed(1)}kg';

String toLBS(int value) => '${(0.220 * value).toStringAsFixed(1)} lbs';
