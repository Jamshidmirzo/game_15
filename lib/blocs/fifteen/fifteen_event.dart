abstract class FifteenEvent {}

class ShuffleEvent extends FifteenEvent {}

class TileTappedEvent extends FifteenEvent {
  final int index;
  TileTappedEvent(this.index);
}
