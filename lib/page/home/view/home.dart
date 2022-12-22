import 'package:belajar_bloc_arsitectur/bloc/export.dart';
import 'package:belajar_bloc_arsitectur/data/model/data_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    RandomBloc randomB = context.read<RandomBloc>();
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            randomB.add(GetRandomEvenet());
            randomB.state.data.toJson();
          },
          child: const Icon(Icons.refresh),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Home Page "),
          actions: const [],
        ),
        body: BlocBuilder<RandomBloc, RandomState>(
          bloc: randomB,
          builder: (context, state) {
            if (state is RandomLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is RandomError) {
              return Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Terjadi Kesalahan",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      state.pesanError,
                      style: const TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              );
            }
            if (state is RandomInitial) {
              return const Center(
                child: Text(
                  "TidaK ada data",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              );
            }

            DataHomeModel data = state.data;

            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              children: [
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.grey,
                  child: Image.network(
                    "${data.profile}",
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(
                  "${data.fullname}",
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "${data.email}",
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                const Divider(
                  color: Colors.red,
                ),
                Text(
                  "${data.title}",
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "${data.category}",
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 150,
                  width: 200,
                  color: Colors.grey,
                  child: Image.network(
                    "${data.gambarProduct}",
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            );
          },
        ));
  }
}
