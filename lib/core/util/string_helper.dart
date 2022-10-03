int? getIdFromString(String url) =>
    int.tryParse(url.substring(0, url.length - 1).split('/').last);

String removeSpecialChars(String str) =>
    str.replaceAll(RegExp(r"[^a-zA-Z' ]+"), "");