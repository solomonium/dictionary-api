import 'package:bloc/bloc.dart';
import 'package:dictionary_app/data/model.dart';
import 'package:dictionary_app/data/word_repo.dart';
import 'package:equatable/equatable.dart';

part 'dictionary_event.dart';
part 'dictionary_state.dart';

class DictionaryBloc extends Bloc<DictionaryEvent, DictionaryState> {
  final WordRepo repository;

  DictionaryBloc({required this.repository}) : super(DictionaryInitial()) {
    on<SearchMeaning>((event, emit) async {
      emit(DictionaryLoading());
      try {
        final WordResponse wordResponse =
            await repository.getMeaning(event.word);
        emit(DictionaryLoaded(wordResponse));
      } catch (_) {
        emit(const DictionaryError('Error fetching Meaning'));
      }
    });
    on<ReturnToPage>((event, emit) => emit(DictionaryInitial()));
  }
}
