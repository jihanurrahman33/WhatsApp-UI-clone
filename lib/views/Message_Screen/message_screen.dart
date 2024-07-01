import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final String name;
  final String Image;
  const MessageScreen({super.key, required this.name, required this.Image});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map> chats = [
    {
      'message': 'Hello',
      'is_me': true,
      'time': '07:34 PM',
    },
    {
      'message': 'Hi, how are you?',
      'is_me': false,
      'time': '07:36 PM',
    },
    {
      'message': 'I\'m good, thanks! How about you?',
      'is_me': true,
      'time': '07:37 PM',
    },
    {
      'message': 'I\'m doing well. What are you up to today?',
      'is_me': false,
      'time': '07:40 PM',
    },
    {
      'message': 'Just working on a project. How about you?',
      'is_me': true,
      'time': '07:42 PM',
    },
    {
      'message': 'Same here. It\'s been a busy week.',
      'is_me': false,
      'time': '07:45 PM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF065D55),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Expanded(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
              backgroundImage: NetworkImage(widget.Image),
            ),
            title: Text(
              widget.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
            subtitle: Text(
              'Last seen:07:45',
              style: TextStyle(color: Colors.white.withOpacity(0.5)),
            ),
            trailing: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(15),
              itemCount: chats.length,
              itemBuilder: (context, index) {
                final data = chats[index];
                return //Text(data['message']);
                    Column(
                  crossAxisAlignment: data['is_me'] == true
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 200,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          margin: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: data['is_me'] == false
                                ? const Color(0xFF065D55)
                                : const Color.fromARGB(255, 0, 0, 0)
                                    .withOpacity(0.85),
                            borderRadius: data['is_me']
                                ? const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  )
                                : const BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                          ),
                          child: Text(
                            data['message'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Text(data['time']),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Center(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.emoji_emotions_outlined),
                            suffix: Icon(Icons.link),
                            hintText: 'Enter your message',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const CircleAvatar(
                backgroundColor: Color(0xFF065D55),
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
