import 'package:flutter/material.dart';

class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 41, 116, 43),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: ListTile(
          leading: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          title: const Text(
            "Go taxi",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          subtitle: const Text(
            "en ligne ",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.video_camera_back_sharp,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.phone,
            color: Colors.white,
            size: 30,
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        color: const Color.fromARGB(255, 247, 240, 240),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 115, 127, 136),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "AUJOURD'HUI",
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    String msg = [
                      "Salut coucou comment tu vas  c'est jerome le gar du taxi",
                      "coucou ",
                      "c'est encore moi jerome ",
                      "ok",
                      "je viens te rewntre visite a x heure ",
                      "salut encore "
                    ][index];
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Row(
                            mainAxisAlignment: index % 2 != 0
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                padding: const EdgeInsets.all(4.0),
                                constraints: msg.length > 15
                                    ? BoxConstraints(
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                0.7)
                                    : BoxConstraints(
                                        maxWidth:
                                            MediaQuery.sizeOf(context).width *
                                                0.3,
                                      ),
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: index % 2 != 0
                                        ? const Color.fromARGB(
                                            255, 183, 235, 184)
                                        : Colors.white),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      msg,
                                      softWrap: true,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.check,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: index % 2 != 0 ? 0 : 0,
                          child: Container(
                              width: 10,
                              height: 10,
                              color: index % 2 != 0
                                  ? const Color.fromARGB(255, 183, 235, 184)
                                  : Colors.white),
                        )
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
