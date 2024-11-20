import 'package:debut_pratique/bloc/counter_bloc.dart';
import 'package:debut_pratique/counter_view/another_view.dart';
import 'package:debut_pratique/cubit/counter_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubitCubit, CounterCubitState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Counter  ${state.count}"),
            centerTitle: true,
          ),
          body: Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.count.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 29),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        onHover: (value) {
                          if (value) {
                            BlocProvider.of<CounterCubitCubit>(context)
                                .incrementCount();
                          }
                        },
                        onPressed: () {
                          BlocProvider.of<CounterCubitCubit>(context)
                              .incrementCount();
                        },
                        child: const Text("+")),
                    const SizedBox(
                      width: 20,
                    ),
                    TextButton(
                        onHover: (value) {
                          if (value) {
                            BlocProvider.of<CounterCubitCubit>(context)
                                .deccrementCount();
                          }
                        },
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.green),
                        ),
                        onPressed: () {
                          BlocProvider.of<CounterCubitCubit>(context)
                              .deccrementCount();
                        },
                        child: const Text("-"))
                  ],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AnotherViewScreen()));
            },
            child: Icon(Icons.arrow_circle_right_rounded),
          ),
          bottomNavigationBar: BottomNavigationBar(items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.cabin,
                  color: Colors.red,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.read_more,
                  color: Colors.red,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.read_more,
                  color: Colors.red,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.read_more,
                  color: Colors.red,
                ),
                label: "")
          ]),
        );
      },
    );
  }
}
