import 'dart:convert';

import 'package:collection/collection.dart';

import 'apple_music.dart';
import 'spotify.dart';

class Result {
  String? artist;
  String? title;
  String? album;
  String? releaseDate;
  String? label;
  String? timecode;
  String? songLink;
  AppleMusic? appleMusic;
  Spotify? spotify;

  Result({
    this.artist,
    this.title,
    this.album,
    this.releaseDate,
    this.label,
    this.timecode,
    this.songLink,
    this.appleMusic,
    this.spotify,
  });

  @override
  String toString() {
    return 'Result(artist: $artist, title: $title, album: $album, releaseDate: $releaseDate, label: $label, timecode: $timecode, songLink: $songLink, appleMusic: $appleMusic, spotify: $spotify)';
  }

  factory Result.fromMap(Map<String, dynamic> data) => Result(
        artist: data['artist'] as String?,
        title: data['title'] as String?,
        album: data['album'] as String?,
        releaseDate: data['release_date'] as String?,
        label: data['label'] as String?,
        timecode: data['timecode'] as String?,
        songLink: data['song_link'] as String?,
        appleMusic: data['apple_music'] == null
            ? null
            : AppleMusic.fromMap(data['apple_music'] as Map<String, dynamic>),
        spotify: data['spotify'] == null
            ? null
            : Spotify.fromMap(data['spotify'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'artist': artist,
        'title': title,
        'album': album,
        'release_date': releaseDate,
        'label': label,
        'timecode': timecode,
        'song_link': songLink,
        'apple_music': appleMusic?.toMap(),
        'spotify': spotify?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Result].
  factory Result.fromJson(String data) {
    return Result.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Result] to a JSON string.
  String toJson() => json.encode(toMap());

  Result copyWith({
    String? artist,
    String? title,
    String? album,
    String? releaseDate,
    String? label,
    String? timecode,
    String? songLink,
    AppleMusic? appleMusic,
    Spotify? spotify,
  }) {
    return Result(
      artist: artist ?? this.artist,
      title: title ?? this.title,
      album: album ?? this.album,
      releaseDate: releaseDate ?? this.releaseDate,
      label: label ?? this.label,
      timecode: timecode ?? this.timecode,
      songLink: songLink ?? this.songLink,
      appleMusic: appleMusic ?? this.appleMusic,
      spotify: spotify ?? this.spotify,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Result) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      artist.hashCode ^
      title.hashCode ^
      album.hashCode ^
      releaseDate.hashCode ^
      label.hashCode ^
      timecode.hashCode ^
      songLink.hashCode ^
      appleMusic.hashCode ^
      spotify.hashCode;
}
