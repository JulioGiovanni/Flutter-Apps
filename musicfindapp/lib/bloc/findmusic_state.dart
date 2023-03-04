part of 'findmusic_bloc.dart';

abstract class FindMusicState {
  final Record record = Record();
  final bool isRecording;
  final List<dynamic> favorites;
  final String message;
  final dynamic song;
  FindMusicState(
      {this.isRecording = false,
      this.favorites = const [],
      this.message = '',
      this.song = const {}});
}

class FindMusicInitial extends FindMusicState {
  FindMusicInitial() : super(isRecording: false, favorites: []);
}

class FindMusicRecording extends FindMusicState {
  final bool recording;
  FindMusicRecording(this.recording) : super(isRecording: recording);
}

class FindMusicStop extends FindMusicState {
  FindMusicStop() : super(isRecording: false);
}

class FindMusicFound extends FindMusicState {
  FindMusicFound({required dynamic song})
      : super(isRecording: false, song: song);
}

class FindMusicError extends FindMusicState {
  FindMusicError() : super(isRecording: false);
}

class FindMusicFavorites extends FindMusicState {
  FindMusicFavorites({required dynamic favorites, dynamic song})
      : super(favorites: favorites, song: song);
}

class FindMusicFavoritesError extends FindMusicState {
  final String errorMessage = '';
  FindMusicFavoritesError({required String errorMessage})
      : super(message: errorMessage);
}

class FindMusicSingleFavorite extends FindMusicState {
  final dynamic favorite = {};
  FindMusicSingleFavorite({required Object favorite});
}
