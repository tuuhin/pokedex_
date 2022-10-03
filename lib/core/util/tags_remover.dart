String tagRemover(String str) {
  return str.replaceAll(RegExp(r'<.*?>'), '');
}
