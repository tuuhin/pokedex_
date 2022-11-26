int getIdFromString(String url) =>
    int.tryParse(url.substring(0, url.length - 1).split('/').last) ?? 1;

String removeSpecialChars(String str) =>
    str.replaceAll(RegExp(r"[^a-zA-Z.]+", multiLine: true), ' ');

int? getOffsetFromString(String url) =>
    int.tryParse(Uri.parse(url).queryParameters["offset"] ?? '');

String tagRemover(String str) {
  return str.replaceAll(RegExp(r'<.*?>'), '');
}

String decoratedId(int id) => "#${"$id".padLeft(3, "0")}";

extension StringExtension on String {
  String toTitleCase() {
    Iterable<String> capitalized = split(' ').map((word) {
      var first = word.substring(0, 1).toUpperCase();
      var rest = word.substring(1);
      return '$first$rest';
    });
    return capitalized.join(' ');
  }

  String simpleName() {
    Iterable<String> words = split('-');

    if (words.length > 1) {
      String firstword = words.first.substring(0, 2).toTitleCase();
      String secondWord = words.skip(1).first.toTitleCase();

      return "$firstword. $secondWord";
    }
    return toTitleCase();
  }

  String removeDash() {
    Iterable<String> words = split('-');
    return words.join(" ");
  }
}
