import 'dart:core';

String removeDiacritics(String str) {
  const accents = 'àáâãäåçèéêëìíîïðñòóôõöùúûüýÿ';
  const without = 'aaaaaaceeeeiiiionooooouuuuyy';

  String normalizedString = str.split('').map((char) {
    int index = accents.indexOf(char);
    return index != -1 ? without[index] : char;
  }).join('');

  return normalizedString;
}
