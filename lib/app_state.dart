class AppState{
  final counter;
  AppState({required this.counter});
}
class InitialState extends AppState{
   InitialState():super(counter: 0);
}
