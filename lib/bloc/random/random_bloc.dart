import 'package:belajar_bloc_arsitectur/data/model/data_home.dart';
import 'package:belajar_bloc_arsitectur/data/reporsitories/random_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'random_event.dart';
part 'random_state.dart';

class RandomBloc extends Bloc<RandomEvent, RandomState> {
  RandomRepository randomRepository;

  RandomBloc(this.randomRepository) : super(RandomInitial(DataHomeModel())) {
    on<GetRandomEvenet>((event, emit) async {
      try {
        emit(RandomLoading(state.data));
        Map<String, dynamic> dataRandom =
            await randomRepository.getRandomData();
        if (dataRandom["error"] == true) {
          String pesanError = dataRandom["message"];
          emit(RandomError(state.data, pesanError));

          throw dataRandom["message"];
        } else {
          DataHomeModel dataHome = dataRandom["data"];
          emit(RandomFinish(dataHome));
        }
      } catch (e) {
        emit(RandomError(state.data, e.toString()));
      }
    });
  }
}
