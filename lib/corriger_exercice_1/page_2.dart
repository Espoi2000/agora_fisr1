import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var sieze = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 80, 3, 180),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "Quiz of the week",
          style: TextStyle(
            color: Color.fromARGB(255, 80, 3, 180),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        height: sieze.height,
        width: sieze.width,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              width: sieze.width,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 80, 3, 180),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Center(
                child: Icon(
                  Icons.alarm,
                  color: Colors.white,
                  size: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Quiz of the week",
              style: TextStyle(
                color: Color.fromARGB(255, 80, 3, 180),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    height: sieze.height / 7,
                    width: sieze.width / 3.2 - 8,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 80, 3, 180),
                        ),
                        Text("20 questions")
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Become the best and fastest player of quiz of the week worldwide and win ${50}",
              style: TextStyle(
                color: Color.fromARGB(255, 80, 3, 180),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "This quiz is about design tools for non- designers. Challenge yourself and your friends!!!",
              style: TextStyle(
                color: Color.fromARGB(255, 80, 3, 180),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: sieze.width / 2,
                  child: SecondApplicationButton(
                    size: sieze,
                    text: "Play solo",
                    textColor: const Color.fromARGB(255, 80, 3, 180),
                    border: Border.all(
                        width: 1, color: Color.fromARGB(255, 80, 3, 180)),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SecondApplicationButton(
                    size: sieze,
                    text: "Challenge friends",
                    textColor: Colors.white,
                    color: const Color.fromARGB(255, 80, 3, 180),
                    border: Border.all(
                        width: 1, color:const Color.fromARGB(255, 80, 3, 180)),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SecondApplicationButton extends StatelessWidget {
  const SecondApplicationButton(
      {super.key,
      required this.size,
      required this.text,
      this.onTap,
      this.border,
      this.color,
      this.textColor});

  final Size size;
  final String text;
  final Function()? onTap;
  final BoxBorder? border;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: size.width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: border),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
