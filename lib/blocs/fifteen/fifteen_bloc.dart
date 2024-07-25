import 'package:flutter_bloc/flutter_bloc.dart';
import 'fifteen_event.dart';
import 'fifteen_state.dart';

class FifteenBloc extends Bloc<FifteenEvent, FifteenState> {
  FifteenBloc() : super(InitialStateFifteen(List.generate(16, (index) => index))) {
    on<ShuffleEvent>((event, emit) {
      final numbers = List<int>.from(state.numbers);
      numbers.shuffle();
      emit(ShuffledState(numbers));
    });

    on<TileTappedEvent>((event, emit) {
      final numbers = List<int>.from(state.numbers);
      _moveTile(numbers, event.index);
      emit(UpdatedState(numbers));
    });
  }

  void _moveTile(List<int> numbers, int index) {
    int emptyIndex = numbers.indexOf(0);
    if (_isAdjacent(index, emptyIndex)) {
      numbers[emptyIndex] = numbers[index];
      numbers[index] = 0;
    }
  }

  bool _isAdjacent(int index, int emptyIndex) {
    int row = index ~/ 4;
    int col = index % 4;
    int emptyRow = emptyIndex ~/ 4;
    int emptyCol = emptyIndex % 4;

    return (row == emptyRow && (col - emptyCol).abs() == 1) ||
           (col == emptyCol && (row - emptyRow).abs() == 1);
  }
}
