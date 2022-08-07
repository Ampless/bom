import 'dart:convert';

import 'package:bom/bom.dart';

void main() {
  final raw = [239, 187, 191, 195, 142, 195, 177, 197, 163, 195] +
      [169, 114, 195, 177, 195, 165, 197, 163, 195, 174, 195] +
      [182, 195, 177, 195, 165, 196, 188, 195, 174, 197, 190] +
      [195, 165, 197, 163, 195, 174, 225, 187, 157, 195, 177];
  if (UnicodeEncoding.fromBom(raw) == UnicodeEncoding.utf8) {
    print(utf8.decode(raw));
  } else {
    print('Invalid encoding.');
  }
}
