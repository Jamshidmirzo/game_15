abstract class FifteenState {
  final List<int> numbers;
  FifteenState(this.numbers);
}

class InitialStateFifteen extends FifteenState {
  InitialStateFifteen(List<int> numbers) : super(numbers);
}

class ShuffledState extends FifteenState {
  ShuffledState(List<int> numbers) : super(numbers);
}

class UpdatedState extends FifteenState {
  UpdatedState(List<int> numbers) : super(numbers);
}
