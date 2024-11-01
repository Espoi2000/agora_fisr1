import 'package:debut_pratique/clone_whatsapp_ui/discussion_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeWhatsapp extends StatefulWidget {
  const HomeWhatsapp({super.key});

  @override
  State<HomeWhatsapp> createState() => _HomeWhatsappState();
}

class _HomeWhatsappState extends State<HomeWhatsapp>
    with TickerProviderStateMixin {
  late final TabController tabController;

  List<User> users = [
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Salut tout le monde ",
        name: "Jane"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Bienvenue ",
        name: "Jeremie"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Allez en brousse avec ça  ",
        name: "David"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut gar tu fais comment des 1 millions là",
        name: "Roger"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut la go tu kem laver mes habits quand ",
        name: "ines"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Salut tout le monde ",
        name: "Jane"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Bienvenue ",
        name: "Jeremie"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Allez en brousse avec ça  ",
        name: "David"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut gar tu fais comment des 1 millions là",
        name: "Roger"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut la go tu kem laver mes habits quand ",
        name: "ines"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Salut tout le monde ",
        name: "Jane"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Bienvenue ",
        name: "Jeremie"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Allez en brousse avec ça  ",
        name: "David"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut gar tu fais comment des 1 millions là",
        name: "Roger"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut la go tu kem laver mes habits quand ",
        name: "ines"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Salut tout le monde ",
        name: "Jane"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Bienvenue ",
        name: "Jeremie"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "Allez en brousse avec ça  ",
        name: "David"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut gar tu fais comment des 1 millions là",
        name: "Roger"),
    User(
        date: DateTime.timestamp().toString(),
        discussion: "salut la go tu kem laver mes habits quand ",
        name: "ines"),
  ];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 116, 43),
        title: const Text(
          "Whatsapp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
        bottom: TabBar(
          unselectedLabelColor: Colors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 4.0,
          indicatorColor: Colors.white,
          labelStyle: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          controller: tabController,
          tabs: const [
            Tab(
              text: "TEXT",
            ),
            Tab(
              text: "CALLS",
            ),
            Tab(
              text: "STATUS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: ListView.separated(
              itemCount: users.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 0.2,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                User user = users[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DiscussionScreen()));
                  },
                  child: DiscussionTile(
                    index: index,
                    date: DateFormat("HH:mm").format(DateTime.parse(user.date)),
                    userName: user.name,
                    message: user.discussion,
                  ),
                );
              },
            ),
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.blue,
          ),
          Container(
            height: size.height,
            width: size.width,
            color: Colors.amber,
          ),
        ],
      ),
    );
  }
}

class DiscussionTile extends StatelessWidget {
  const DiscussionTile(
      {super.key,
      required this.index,
      required this.date,
      required this.message,
      required this.userName});
  final int index;
  final String userName;
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 50,
        height: 50,
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.accents[4]),
        // child: Image.network("https://picsum.photos/100"),
      ),
      title: Text(
        userName,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        message,
      ),
      trailing: Column(
        children: [
          Text(
            date,
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              8,
            ),
            decoration: const BoxDecoration(
                color: Colors.green, shape: BoxShape.circle),
            child: const Text(
              "2",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class User {
  final String name;
  final String discussion;
  final String date;
  final int? total;

  User(
      {required this.date,
      required this.discussion,
      required this.name,
      this.total});
}
