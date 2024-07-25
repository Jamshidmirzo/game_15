import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_15/blocs/fifteen/fifteen_bloc.dart';
import 'package:game_15/blocs/fifteen/fifteen_event.dart';
import 'package:game_15/blocs/fifteen/fifteen_state.dart';
import 'package:game_15/ui/widgets/gridButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FifteenBloc()..add(ShuffleEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Fifteen game",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: BlocBuilder<FifteenBloc, FifteenState>(
          builder: (context, state) {
            if (state is InitialStateFifteen ||
                state is ShuffledState ||
                state is UpdatedState) {
              final numbers = state.numbers;
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: numbers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return numbers[index] != 0
                      ? GestureDetector(
                          onTap: () => context
                              .read<FifteenBloc>()
                              .add(TileTappedEvent(index)),
                          child: GridButton(number: numbers[index]),
                        )
                      : const SizedBox.shrink();
                },
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
