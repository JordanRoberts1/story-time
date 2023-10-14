/// https://platform.openai.com/docs/api-reference/chat/create
class  ChatRequest {
  late List<Message> messages;
  late String model;
  int? max_tokens;
  int? n;
  String? user;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'messages': messages.map((Message message) => message.toJson()).toList(),
    'model': model,
    'max_tokens': max_tokens,
    'n': n,
    'user': user,
  };
}

class Message {
  late String content;
  late String role;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'content': content,
    'role': role,
  };
}
