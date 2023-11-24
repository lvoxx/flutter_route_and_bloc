sealed class CounterEvent {}

final class CounterResetPressed extends CounterEvent {}

final class CounterIncrementPressed extends CounterEvent {}

final class CounterDecrementPressed extends CounterEvent {}
