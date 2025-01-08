import 'dart:convert';

String encodeSplitDetails(String splitId) {
  final data = jsonEncode({
    'splitId': splitId,
  });
  return base64.encode(utf8.encode(data));
}