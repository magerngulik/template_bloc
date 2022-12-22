import 'package:belajar_bloc_arsitectur/data/reporsitories/random_repository.dart';

import 'bloc/export.dart';

class App extends StatelessWidget {
  App({super.key});

  final RandomRepository randomRepository = RandomRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RandomBloc(randomRepository),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
