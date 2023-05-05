class Messages {
  final String? senderName;
  final String? senderEmail;
  final String? lastMessage;
  final String? unreadMessages;

  Messages(
      {this.senderName,
      this.senderEmail,
      this.lastMessage,
      this.unreadMessages});

  Map<String, dynamic> toJson() {
    return {
      'senderName': senderName,
      'senderEmail': senderEmail,
      'lastMessage': lastMessage,
      'unreadMessage': unreadMessages,
    };
  }

  Messages.fromJson(Map<String, dynamic> json) 
    : this(
      senderName: json['senderName'] as String,
      senderEmail: json['senderEmail'] as String,
      lastMessage: json['lastMessage'] as String,
      unreadMessages: json['unreadMessages'] as String
    );
  
}
