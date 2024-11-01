import 'package:debut_pratique/clone_whatsapp_ui/home_whatsapp_ui.dart';
import 'package:debut_pratique/corriger_exercice_1/page_1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        home: HomeWhatsapp()
        //  MyHomePage(
        //   title: "counter color ",
        // )
        //     Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       "Pinterest",
        //       style: TextStyle(
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //     backgroundColor: Colors.red,
        //     centerTitle: true,
        //   ),
        //   body: Container(
        //     width: MediaQuery.sizeOf(context).width,
        //     height: MediaQuery.sizeOf(context).height,
        //     padding: EdgeInsets.all(10),
        //     color: Colors.white,
        //     child: Column(
        //       children: [
        //         SizedBox(
        //           height: MediaQuery.sizeOf(context).height / 4,
        //           child: ListView(
        //             scrollDirection: Axis.horizontal,
        //             children: [
        //               for (var i = 0; i <= 3; i++)
        //                 Container(
        //                   margin: const EdgeInsets.only(right: 10),
        //                   width: MediaQuery.sizeOf(context).width,
        //                   decoration: BoxDecoration(
        //                     color: Colors.blue,
        //                     borderRadius: BorderRadius.circular(30),
        //                     image: const DecorationImage(
        //                         image: AssetImage(
        //                             "assets/image/marketing_banner_h_one_left.jpg"),
        //                         fit: BoxFit.cover),
        //                   ),
        //                   child: Center(
        //                     child: Text(
        //                       "Tesct de $i",
        //                       style: TextStyle(color: Colors.white, fontSize: 30),
        //                     ),
        //                   ),
        //                 )
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         const Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           children: [
        //             Text(
        //               "Categorie",
        //               style: TextStyle(
        //                 color: Colors.black,
        //                 fontSize: 18,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //             Text(
        //               "Voir plus (30)",
        //               style: TextStyle(
        //                 color: Colors.red,
        //                 fontSize: 14,
        //                 fontWeight: FontWeight.bold,
        //               ),
        //             ),
        //           ],
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Expanded(
        //           child: GridView.builder(
        //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //                 crossAxisCount: 3,
        //                 mainAxisSpacing: 10,
        //                 crossAxisSpacing: 10),
        //             itemCount: 30,
        //             itemBuilder: (BuildContext context, int index) {
        //               return Container(
        //                 width: 150,
        //                 height: 300,
        //                 decoration: const BoxDecoration(
        //                   color: Colors.white,
        //                   boxShadow: [
        //                     BoxShadow(
        //                       color: Color.fromRGBO(0, 0, 0, 0.032),
        //                       blurRadius: 1,
        //                       spreadRadius: 2,
        //                       offset: Offset(2, 2),
        //                     ),
        //                     BoxShadow(
        //                       color: Color.fromRGBO(0, 0, 0, 0.032),
        //                       blurRadius: 10,
        //                       spreadRadius: 2,
        //                       offset: Offset(2, 2),
        //                     )
        //                   ],
        //                 ),
        //                 child: Column(
        //                   children: [
        //                     ClipRRect(
        //                       borderRadius: const BorderRadius.only(
        //                         topLeft: Radius.circular(10),
        //                         topRight: Radius.circular(10),
        //                       ),
        //                       child: Image.asset(
        //                         "assets/image/marketing_banner_h_one_left.jpg",
        //                         width: 100,
        //                       ),
        //                     ),
        //                     Text("Product  $index")
        //                   ],
        //                 ),
        //               );
        //             },
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        //   floatingActionButton: Container(
        //     width: 50,
        //     height: 50,
        //     decoration: BoxDecoration(
        //       color: Colors.red,
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //     child: Center(
        //       child: Icon(
        //         Icons.add,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        //   bottomNavigationBar: BottomNavigationBar(items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(
        //         Icons.home,
        //         color: Colors.red,
        //       ),
        //       label: "Home",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.search, color: Colors.grey),
        //       label: "Search",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.add, color: Colors.grey),
        //       label: "Add",
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.person, color: Colors.grey),
        //       label: "Person",
        //     ),
        //   ]),
        // ),
        );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      
      _counter++;
    });
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Incrementons ',
            ),
            Text(
              '$_counter',
              style: TextStyle(
                  color: _counter < 5 ? Colors.blue : Colors.amber,
                  fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        foregroundColor: Colors.red,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
