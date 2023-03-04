import 'package:bloc/bloc.dart';

import 'package:musicfindapp/API/music_api.dart';
import 'package:musicfindapp/utils/utils.dart';
import 'package:record/record.dart';

part 'findmusic_event.dart';
part 'findmusic_state.dart';

final record = Record();
final api = APIRepository();

class FindMusicBloc extends Bloc<FindmusicEvent, FindMusicState> {
  FindMusicBloc() : super(FindMusicInitial()) {
    on<IsRecording>((event, emit) async {
      emit(FindMusicRecording(event.isRecording));
      // Check and request permission

      if (event.isRecording) {
        if (await record.hasPermission()) {
          // Start recording
          var tempDir = await obtainTempPath();
          await record.start(
            path: '$tempDir/song.m4a',
            encoder: AudioEncoder.aacLc, // by default
            bitRate: 128000, // by default
            samplingRate: 44100, // by default
          );

          await Future.delayed(const Duration(seconds: 5));
          final filename = await record.stop();
          emit(FindMusicStop());
          final song = await api.findSong(filename!);
          emit(FindMusicFound(song: song));
        }
      } else {
        // Stop recording
        final filename = await record.stop();
        emit(FindMusicStop());
        final song = await api.findSong(filename!);
        if (song == null) {
          emit(FindMusicError());
        }
        emit(FindMusicFound(song: song));
      }
    });

    on<AddFavorite>((event, emit) {
      print(event.favorites);
      final found = event.favorites.firstWhere(
          (element) =>
              element['title'] == event.song['title'] &&
              element['artist'] == event.song['artist'],
          orElse: () => []);
      if (found.isNotEmpty) {
        return emit(FindMusicFavoritesError(
            errorMessage: 'La canción ya está en favoritos'));
      }
      final List newFavorites = List.from(event.favorites)
        ..add(event
            .song); // <-- create a new list with the existing favorites and the new favorite
      emit(FindMusicFavorites(
          favorites: newFavorites,
          song: state
              .song)); // <-- update the state with the new list of favorites
    });

    on<RemoveFavorite>((event, emit) {
      final newFavorites = state.favorites
          .where((element) =>
              element['title'] != event.title &&
              element['artist'] != event.artist)
          .toList();
      emit(FindMusicFavorites(favorites: newFavorites, song: state.song));
    });

    on<GetFavorites>((event, emit) async {
      try {
        final favorites = state.favorites;
        emit(FindMusicFavorites(favorites: favorites));
      } catch (e) {
        emit(FindMusicFavoritesError(errorMessage: e.toString()));
      }
    });
    on<GetSingleFavorite>((event, emit) async {
      try {
        final favorite = state.favorites.firstWhere(
            (element) =>
                element['title'] == event.title &&
                element['artist'] == event.artist,
            orElse: () => null);
        emit(FindMusicSingleFavorite(favorite: favorite));
      } catch (e) {
        emit(FindMusicFavoritesError(errorMessage: e.toString()));
      }
    });
  }
}
