import 'package:flutter/material.dart';

class HomeWhatsapp extends StatefulWidget {
  const HomeWhatsapp({super.key});

  @override
  State<HomeWhatsapp> createState() => _HomeWhatsappState();
}

class _HomeWhatsappState extends State<HomeWhatsapp>
    with TickerProviderStateMixin {
  late final TabController tabController;

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
        body: TabBarView(controller: tabController, children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  thickness: 0.2,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.accents[index]),
                    // child: Image.network("https://picsum.photos/100"),
                  ),
                  title: const Text(
                    "Jane",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: const Text(
                    "Vérifiez les câbles réseau, le modem et le routeur et le routeur.",
                  ),
                  trailing: Column(
                    children: [
                      const Text(
                        "08:22",
                        style: TextStyle(
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
        ]));
  }
}
