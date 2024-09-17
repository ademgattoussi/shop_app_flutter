import 'package:cartelly_shop/models/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  
final _firestore = FirebaseFirestore.instance;
late User signedInUser;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static const screenRoute = "chat_screen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {



  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? messageText;


  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser(){
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Row(
          children: [
            Spacer(),
            const Icon(Icons.support_agent, size: 40, color: kBackgroundColor,),
            const SizedBox(width: 10,),
            const Text(
              "Messaging app",
              style: TextStyle(
                color: kBackgroundColor,
              ),
            ),
            Spacer(),
          ],
        ),
        actions: [
          IconButton(onPressed: () {
            _auth.signOut();
            Navigator.pop(context);
          }, icon: const Icon(Icons.close)),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MessageStreamBuilder(),
           Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: kPrimaryColor,
                    width: 2,
                  )
                )
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: TextField(
                    controller: messageTextController,
                    onChanged: (value) {
                      messageText = value;
                    },
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      hintText: "Write your message here ...",
                      border: InputBorder.none)
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _firestore.collection('messages').add({
                        'text' : messageText,
                        'sender' : signedInUser.email,
                        'time' : FieldValue.serverTimestamp(),
                      });
                      messageTextController.clear();
                    },
                    child: const Text(
                      'send',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        )
      ),
    );
  }
}



class MessageStreamBuilder extends StatelessWidget {
  const MessageStreamBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder <QuerySnapshot>(
              stream: _firestore.collection('messages').orderBy('time').snapshots(),
              builder: (context, snapshot) {
                List<MessageLine> messageWidgets = [];

                  if (!snapshot.hasData){
                    return const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: kBlueColor,
                      ),
                    );
                  }
                  final messages = snapshot.data!.docs;
                  for (var message in messages){
                    final messageSender = message.get('sender');
                    final currentUser = signedInUser.email;
                    if (messageSender == currentUser || messageSender == "Support") {
                    final messageText = message.get('text');
                    final messageWidget = MessageLine(sender: messageSender, text: messageText, isUser: currentUser == messageSender,);
                    messageWidgets.add(messageWidget);
                    }
                  }
                return Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    children: messageWidgets,
          ),
        );
      }
    );
  }
}



class MessageLine extends StatelessWidget {
  const MessageLine({super.key, this.sender, this.text, required this.isUser});

  final String? sender;
  final String? text;
  final bool isUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isUser? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            isUser ? '$sender' : 'Support',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black45
            ),
          ),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(50),
              bottomRight: const Radius.circular(50),
              topRight: Radius.circular(isUser ? 5 : 50),
              topLeft: Radius.circular(isUser ? 50 : 5),
            ),
            color: isUser? kBlueColor : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text (
                '$text',
                style: TextStyle(
                  color: isUser ? Colors.white : kBlueColor,
                ),
              ),
            ),
          )
        ]
      )
    );
  }
}