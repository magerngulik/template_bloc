import 'package:belajar_bloc_arsitectur/bloc/export.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () {
            //
          },
        ),
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: const [],
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Container(
              height: 200,
              width: 200,
              color: Colors.grey,
            ),
            const Text(
              "M. Zulkarnaen",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Zulkarnaim70@gmail.com",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            const Divider(
              color: Colors.red,
            ),
            const Text(
              "Masakan enak banget",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "5 porsi",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Tingkat kesulitan (Rumit)",
              style: TextStyle(
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
            )
          ],
        ));
  }
}
