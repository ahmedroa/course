class SocialUserModel {
  final String name;
  final String email;
  final String phone;
  final String uid;
  final String image;
  final bool isEmailVerified;

  SocialUserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uid,
      required this.image,
      required this.isEmailVerified});
  factory SocialUserModel.fromJson(Map<String, dynamic> json) {
    return SocialUserModel(
      name: json['name'],
      image: json['images'],
      email: json['email'],
      phone: json['phone'],
      uid: json['uid'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'images': image,
      'uid': uid,
      'isEmailVerified': isEmailVerified,
    };
  }
}

class UserModel {
  final String name;
  final String email;
  final String phone;
  final String uid;
  final String images;
  final bool isEmailVerified;

  UserModel(
      {required this.name,
      required this.email,
      required this.phone,
      required this.uid,
      required this.images,
      required this.isEmailVerified});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      uid: json['uid'],
      images: json['images'],
      isEmailVerified: json['isEmailVerified'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uid': uid,
      'images': images,
      'isEmailVerified': isEmailVerified,
    };
  }
}

class messageModel {
  final String senderid;
  final String receiverID;
  final String dateTime;
  final String text;

  messageModel({
    required this.senderid,
    required this.receiverID,
    required this.dateTime,
    required this.text,
  });
  factory messageModel.fromJson(Map<String, dynamic> json) {
    return messageModel(
      senderid: json['senderid'],
      receiverID: json['receiverID'],
      dateTime: json['dateTime'],
      text: json['text'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'senderid': senderid,
      'receiverID': receiverID,
      'dateTime': dateTime,
      'text': text,
    };
  }
}

class MessageDataModel {
  MessageDataModel({
    required this.senderId,
    required this.receiverId,
    required this.message,
    required this.time,
  });

  late final String senderId;
  late final String receiverId;
  late final String message;
  late final String time;

  MessageDataModel.fromJson(Map<String, dynamic> json) {
    senderId = json['senderId'] ?? '';
    receiverId = json['receiverId'] ?? '';
    message = json['message'] ?? '';
    time = json['time'] ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message,
      'time': time,
    };
  }
}
