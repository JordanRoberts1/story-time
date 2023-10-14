import 'dart:convert';

/// https://platform.openai.com/docs/api-reference/chat/object
class ChatResponse {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choice?>? choices;
  Usage? usage;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'object': object,
    'created': created,
    'model': model,
    'choices': choices?.map((Choice? choice) => choice?.toJson()).toList(),
    'usage': json.encode(usage?.toJson()),
  };

  static ChatResponse fromJson(Map<String, dynamic> map) => ChatResponse()
    ..id = map['id']
    ..object = map['object']
    ..created = map['created']
    ..model = map['model']
    ..choices = map['choices'] == null
      ? null
      : (map['choices'] as List<Map<String, dynamic>>).map((Map<String, dynamic>? choice) => choice == null 
          ? null 
          : Choice.fromJson(choice)
        ).toList()
    ..usage = Usage.fromJson(json.decode(map['usage']));
}

class Choice {
  int? index;
  Message? message;
  String? finish_reason;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'index': index,
    'message': json.encode(message?.toJson()),
    'finish_reason': finish_reason,
  };

  static Choice fromJson(Map<String, dynamic> map) => Choice()
    ..index = map['index']
    ..message = Message.fromJson(json.decode(map['message']))
    ..finish_reason = map['finish_reason'];  
}

class Message {
  String? role;
  String? content;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'role': role,
    'content': content,
  };

  static Message fromJson(Map<String, dynamic> map) => Message()
    ..role = map['role']
    ..content = map['content'];
}

class Usage {
  int? prompt_tokens;
  int? completion_tokens;
  int? total_tokens;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'prompt_tokens': prompt_tokens,
    'completion_tokens': completion_tokens,
    'total_tokens': total_tokens,
  };

  static Usage fromJson(Map<String, dynamic> map) => Usage()
    ..prompt_tokens = map['prompt_tokens']
    ..completion_tokens = map['completion_tokens']
    ..total_tokens = map['total_tokens'];
}