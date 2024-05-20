class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? status;
  String? currentMessage;
  bool select = false;
  int? id;

  ChatModel({
    this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.status,
    this.currentMessage,
    this.select = false,
    this.id,
  });
}
