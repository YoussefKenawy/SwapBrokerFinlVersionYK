


import 'package:fire99/messages/models/user_model.dart';

class Message {
  final User sender;
  final String
  time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final bool isLiked;
  final bool unread;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unread,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/youssef.jpg',
);

// USERS
final User youssef = User(
  id: 1,
  name: 'Youssef',
  imageUrl: 'assets/images/youssef.jpg',
);
final User ali = User(
  id: 2,
  name: 'Ali',
  imageUrl: 'assets/images/ali.jpg',
);
final User mohab = User(
  id: 3,
  name: 'Mohab',
  imageUrl: 'assets/images/mohab.jpg',
);
final User nour = User(
  id: 4,
  name: 'Nour',
  imageUrl: 'assets/images/nour.jpg',
);
final User jesy = User(
  id: 5,
  name: 'Jesy',
  imageUrl: 'assets/images/jesy.jpg',
);
final User yasmeen = User(
  id: 6,
  name: 'Yasmeen',
  imageUrl: 'assets/images/yasmeen.jpg',
);
final User ahmed = User(
  id: 7,
  name: 'Ahmed',
  imageUrl: 'assets/images/ahmed.jpg',
);

// FAVORITE CONTACTS
List<User> favorites = [youssef, ali, mohab, nour, jesy];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: youssef,
    time: '5:30 PM',
    text: 'Hey, I want wo swap this item with my camera?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: nour,
    time: '4:30 PM',
    text: 'Hey, is this item still availble?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: ali,
    time: '3:30 PM',
    text: 'Hey, How long have u bought this watch ?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: jesy,
    time: '2:30 PM',
    text: 'Hey, can we swap it now?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: ahmed
    ,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: yasmeen,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: nour,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sender: jesy,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: currentUser,
    time: '4:30 PM',
    text: 'Why not!! , i really liked this camera!!',
    isLiked: false,
    unread: true,
  ),

  Message(
    sender: youssef,
    time: '5:36 PM',
    text: 'Hey, I want wo swap this item with my camera?',
    isLiked: true,
    unread: false,
  ),  Message(
    sender: youssef,
    time: '5:34 PM',
    text: 'Hey, I want wo swap this item with my camera?',
    isLiked: false,
    unread: true,
  ), Message(
    sender: youssef,
    time: '5:32 PM',
    text: 'Hey, I want wo swap this item with my camera?',
    isLiked: true,
    unread: true,
  ),
  Message(
    sender: youssef,
    time: '5:30 PM',
    text: 'Hey, I want wo swap this item with my camera?',
    isLiked: false,
    unread: true,
  ),
];