import 'package:bloc_implementation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncDecPage extends StatelessWidget {
  const IncDecPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncremented());
              // counterCubit.increment();
            },

            child: const Icon(Icons.add),
            heroTag: 'increment', // Unique hero tag
          ),
          SizedBox(height: 10), // Added for spacing between buttons
          FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterDecremented());
              // counterCubit.decrement();
            },

            child: const Icon(
                Icons.remove), // Changed to 'remove' icon for decrement
            heroTag: 'decrement', // Unique hero tag
          ),
        ],
      ),
    );
  }
}
