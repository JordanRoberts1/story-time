import 'dart:convert';

import 'package:http/http.dart';
import 'package:story_time/model/chat_request.dart';
import 'package:story_time/model/chat_request.dart' as req;
import 'package:story_time/model/chat_response.dart';

class Service {
  static const String _apiKey = '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';

  static Future<ChatResponse> makeCall(String input) async {
    Uri uri = Uri.parse('https://api.openai.com/v1/chat/completions');
    Map<String, String> headers = <String, String> {
      'Authorization': 'Bearer $_apiKey',
      // 'Content-Type': 'application/json',
    }; 

    req.Message message = req.Message()
      ..content = input
      ..role = 'user';

    ChatRequest chatRequest = ChatRequest()
      ..messages = [message]
      ..model = 'gpt-3.5-turbo';

    Response response = await post(
      uri,
      headers: headers,
      body: chatRequest.toJson(),
    );

    if (response.statusCode == 200) {
      return ChatResponse.fromJson(json.decode(response.body));
    } else {
      throw 'error: ${response.reasonPhrase}';
    }
  }
}