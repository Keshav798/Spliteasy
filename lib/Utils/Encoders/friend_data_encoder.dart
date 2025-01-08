import 'dart:convert';


String encodeFriendDetails(String friendId) {
  final data = jsonEncode({
    'friendId': friendId
  });
  return base64.encode(utf8.encode(data));
}