import 'package:debut_pratique/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnotherViewScreen extends StatelessWidget {
  const AnotherViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(state.count.toString()),
          ),
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: Column(
              children: [Text(state.count.toString())],
            ),
          ),
        );
      },
    );
  }
}
