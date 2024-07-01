import 'package:flutter/material.dart';
import 'package:whatsapp_clone/views/Message_Screen/message_screen.dart';

class Homeview extends StatefulWidget {
  const Homeview({super.key});

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  List<Map> chatList = [
    {
      'name': 'Md Jihanur Rahman',
      'Image':
          'https://media.licdn.com/dms/image/D5603AQEBPJ2XlOCiKA/profile-displayphoto-shrink_200_200/0/1666858390047?e=2147483647&v=beta&t=XDCKTouA-Or7yzoxjz_cYp1uROmSck1impFOAgSln1g',
      'lastMsg': 'kire Ki Obosta Flutter Developer',
      'time': '12:00',
      'count': 0,
    },
    {
      'name': 'John Doe',
      'Image':
          'https://media.licdn.com/dms/image/D5603AQEBPJ2XlOCiKA/profile-displayphoto-shrink_200_200/0/1666858390047?e=2147483647&v=beta&t=XDCKTouA-Or7yzoxjz_cYp1uROmSck1impFOAgSln1g',
      'lastMsg': 'Hey, how have you been?',
      'time': '3:15',
      'count': 2,
    },
    {
      'name': 'Jane Smith',
      'Image':
          'https://media.licdn.com/dms/image/D5603AQEBPJ2XlOCiKA/profile-displayphoto-shrink_200_200/0/1666858390047?e=2147483647&v=beta&t=XDCKTouA-Or7yzoxjz_cYp1uROmSck1impFOAgSln1g',
      'lastMsg': 'Are we still on for tomorrow?',
      'time': '9:30',
      'count': 0,
    },
    {
      'name': 'Alice Johnson',
      'Image':
          'https://media.licdn.com/dms/image/D5603AQEBPJ2XlOCiKA/profile-displayphoto-shrink_200_200/0/1666858390047?e=2147483647&v=beta&t=XDCKTouA-Or7yzoxjz_cYp1uROmSck1impFOAgSln1g',
      'lastMsg': 'Can you send me the report?',
      'time': '11:45',
      'count': 1,
    },
    {
      'name': 'Bob Brown',
      'Image':
          'https://media.licdn.com/dms/image/D5603AQEBPJ2XlOCiKA/profile-displayphoto-shrink_200_200/0/1666858390047?e=2147483647&v=beta&t=XDCKTouA-Or7yzoxjz_cYp1uROmSck1impFOAgSln1g',
      'lastMsg': 'Let’s catch up soon!',
      'time': '5:50',
      'count': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF065D55),
          title: const Text(
            'WhatsApp',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white.withOpacity(.7),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white.withOpacity(.7),
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            unselectedLabelColor: Colors.white.withOpacity(.7),
            labelColor: Colors.white,
            tabs: const [
              Tab(
                icon: Icon(Icons.camera_alt_outlined),
              ),
              Tab(
                text: 'Chats',
              ),
              Tab(
                text: 'Status',
              ),
              Tab(
                text: 'Calls',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //shape: const CircleBorder(),
          backgroundColor: const Color(0xFF065D55),
          onPressed: () {},
          child: const Icon(
            Icons.message,
            color: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            const Column(
              children: [],
            ),
            ListView.builder(
              itemCount: chatList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return MessageScreen(
                        name: chatList[index]['name'],
                        Image: chatList[index]['Image'],
                      );
                    }));
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.amber,
                    backgroundImage: NetworkImage(chatList[index]['Image']),
                  ),
                  title: Text(
                    chatList[index]['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    chatList[index]['lastMsg'],
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chatList[index]['time'],
                        style: TextStyle(
                            color: chatList[index]['count'] == 0
                                ? Colors.black
                                : const Color(0xFF14CD62),
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: chatList[index]['count'] > 0
                              ? const Color(0xFF14CD62)
                              : Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: chatList[index]['count'] > 0
                              ? Text(
                                  chatList[index]['count'].toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )
                              : const Text(''),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const Column(
              children: [],
            ),
            const Column(
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
