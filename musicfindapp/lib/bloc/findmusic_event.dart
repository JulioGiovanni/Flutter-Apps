part of 'findmusic_bloc.dart';

abstract class FindmusicEvent {}

class IsRecording extends FindmusicEvent {
  final bool isRecording;
  IsRecording({required this.isRecording});
}

class GetFavorites extends FindmusicEvent {}

class RemoveFavorite extends FindmusicEvent {
  final String title;
  final String artist;
  RemoveFavorite({required this.title, required this.artist});
}

class GetSingleFavorite extends FindmusicEvent {
  final String title;
  final String artist;
  GetSingleFavorite({required this.title, required this.artist});
}

class AddFavorite extends FindmusicEvent {
  final Map<String, dynamic> song;
  final List<dynamic> favorites;
  AddFavorite({required this.song, required this.favorites});

  @override
  List<Object?> get props => [song, favorites];
}
