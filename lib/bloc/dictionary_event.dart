part of 'dictionary_bloc.dart';

abstract class DictionaryEvent extends Equatable {
  const DictionaryEvent();

  @override
  List<Object> get props => [];
}

class SearchMeaning extends DictionaryEvent {
  final String word;

  const SearchMeaning(this.word);
}
class ReturnToPage extends DictionaryEvent {}

