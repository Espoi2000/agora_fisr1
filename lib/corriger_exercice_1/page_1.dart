import 'package:debut_pratique/corriger_exercice_1/page_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        color: Color.fromARGB(255, 71, 17, 171),
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Question 3 out of 20",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const Text(
              "How many wizards",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "were killed in making",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "of Uizard?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ApplicationButton(
              size: size,
              text: "None",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Page2()));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ApplicationButton(
              size: size,
              text: "10",
            ),
            const SizedBox(
              height: 10,
            ),
            ApplicationButton(
              size: size,
              text: "50",
            ),
            const SizedBox(
              height: 10,
            ),
            ApplicationButton(
              size: size,
              text: "All of them",
            )
          ],
        ),
      ),
    );
  }
}

class ApplicationButton extends StatelessWidget {
  const ApplicationButton(
      {super.key, required this.size, required this.text, this.onTap});

  final Size size;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromARGB(255, 80, 3, 180),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
