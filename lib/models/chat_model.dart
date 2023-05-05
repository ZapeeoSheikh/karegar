class Chat {
  String messageBody;
  String time;
  String senderId;
  String recieverId;
  String messageType;

  Chat(
      {required this.messageBody,
      required this.time,
      required this.senderId,
      required this.recieverId,
      required this.messageType});

  Map<String, dynamic> toJson() {
    return {
      'messageBody' : messageBody,
      'time' : time,
      'senderId' : senderId,
      'recieverId' : recieverId,
      'messageType' : messageType,
    };
  }

  Chat.fromJson(Map<String, dynamic> json)
      : this(
          messageBody: json['messageBody'] as String,
          time: json['time'] as String,
          senderId: json['senderId'] as String,
          recieverId: json['recieverId'] as String,
          messageType: json['messageType'] as String,
        );
}
