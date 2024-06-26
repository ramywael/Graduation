class ChatBotModel {
  late bool isMe;
  late String message;
  String? base64EncodedImage;

  ChatBotModel(
      {required this.isMe, required this.message, this.base64EncodedImage});

  ChatBotModel.fromJson(Map<String, dynamic> json) {
    isMe = json['is_me'];
    message = json['message'];
    base64EncodedImage = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_me'] = isMe;
    data['message'] = message;
    data['image'] = base64EncodedImage;
    return data;
  }
}