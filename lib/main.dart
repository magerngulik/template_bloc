import 'bloc/export.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(App());
}
