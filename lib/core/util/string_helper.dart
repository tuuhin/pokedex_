int? getIdFromString(String url) =>
    int.tryParse(url.substring(0, url.length - 1).split('/').last);

String removeSpecialChars(String str) =>
    '${str.replaceAll(RegExp(r"[^a-zA-Z ']+"), '')}.';

int? getOffsetFromString(String url) =>
    int.tryParse(Uri.parse(url).queryParameters["offset"] ?? '');

String tagRemover(String str) {
  return str.replaceAll(RegExp(r'<.*?>'), '');
}

String decoratedId(int id) => "#${"$id".padLeft(3, "0")}";

extension StringExtension on String {
  String toTitleCase() {
    var capitalized = split(' ').map((word) {
      var first = word.substring(0, 1).toUpperCase();
      var rest = word.substring(1);
      return '$first$rest';
    });
    return capitalized.join(' ');
  }
}
