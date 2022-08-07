library bom;

enum UnicodeEncoding {
  utf8,
  utf16be,
  utf16le,
  utf32be,
  utf32le,
  utf7,
  utf1,
  utfebcdic,
  scsu,
  bocu1,
  gb18030;

  static UnicodeEncoding? fromBom(List<int> string) {
    for (final pair in {
      [239, 187, 191]: utf8,
      [254, 255]: utf16be,
      [255, 254]: utf16le,
      [0, 0, 254, 255]: utf32be,
      [255, 254, 0, 0]: utf32le,
      [43, 47, 118]: utf7,
      [247, 100, 76]: utf1,
      [221, 115, 102, 115]: utfebcdic,
      [14, 254, 255]: scsu,
      [251, 238, 40]: bocu1,
      [132, 49, 149, 51]: gb18030,
    }.entries) {
      if (Iterable.generate(pair.key.length)
          .map((i) => pair.key[i] == string[i])
          .reduce((a, b) => a && b)) return pair.value;
    }
    return null;
  }
}
