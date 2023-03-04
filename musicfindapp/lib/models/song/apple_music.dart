import 'dart:convert';

import 'package:collection/collection.dart';

import 'artwork.dart';
import 'play_params.dart';
import 'preview.dart';

class AppleMusic {
	List<Preview>? previews;
	Artwork? artwork;
	String? artistName;
	String? url;
	int? discNumber;
	List<String>? genreNames;
	int? durationInMillis;
	String? releaseDate;
	String? name;
	String? isrc;
	String? albumName;
	PlayParams? playParams;
	int? trackNumber;
	String? composerName;

	AppleMusic({
		this.previews, 
		this.artwork, 
		this.artistName, 
		this.url, 
		this.discNumber, 
		this.genreNames, 
		this.durationInMillis, 
		this.releaseDate, 
		this.name, 
		this.isrc, 
		this.albumName, 
		this.playParams, 
		this.trackNumber, 
		this.composerName, 
	});

	@override
	String toString() {
		return 'AppleMusic(previews: $previews, artwork: $artwork, artistName: $artistName, url: $url, discNumber: $discNumber, genreNames: $genreNames, durationInMillis: $durationInMillis, releaseDate: $releaseDate, name: $name, isrc: $isrc, albumName: $albumName, playParams: $playParams, trackNumber: $trackNumber, composerName: $composerName)';
	}

	factory AppleMusic.fromMap(Map<String, dynamic> data) => AppleMusic(
				previews: (data['previews'] as List<dynamic>?)
						?.map((e) => Preview.fromMap(e as Map<String, dynamic>))
						.toList(),
				artwork: data['artwork'] == null
						? null
						: Artwork.fromMap(data['artwork'] as Map<String, dynamic>),
				artistName: data['artistName'] as String?,
				url: data['url'] as String?,
				discNumber: data['discNumber'] as int?,
				genreNames: data['genreNames'] as List<String>?,
				durationInMillis: data['durationInMillis'] as int?,
				releaseDate: data['releaseDate'] as String?,
				name: data['name'] as String?,
				isrc: data['isrc'] as String?,
				albumName: data['albumName'] as String?,
				playParams: data['playParams'] == null
						? null
						: PlayParams.fromMap(data['playParams'] as Map<String, dynamic>),
				trackNumber: data['trackNumber'] as int?,
				composerName: data['composerName'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'previews': previews?.map((e) => e.toMap()).toList(),
				'artwork': artwork?.toMap(),
				'artistName': artistName,
				'url': url,
				'discNumber': discNumber,
				'genreNames': genreNames,
				'durationInMillis': durationInMillis,
				'releaseDate': releaseDate,
				'name': name,
				'isrc': isrc,
				'albumName': albumName,
				'playParams': playParams?.toMap(),
				'trackNumber': trackNumber,
				'composerName': composerName,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppleMusic].
	factory AppleMusic.fromJson(String data) {
		return AppleMusic.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [AppleMusic] to a JSON string.
	String toJson() => json.encode(toMap());

	AppleMusic copyWith({
		List<Preview>? previews,
		Artwork? artwork,
		String? artistName,
		String? url,
		int? discNumber,
		List<String>? genreNames,
		int? durationInMillis,
		String? releaseDate,
		String? name,
		String? isrc,
		String? albumName,
		PlayParams? playParams,
		int? trackNumber,
		String? composerName,
	}) {
		return AppleMusic(
			previews: previews ?? this.previews,
			artwork: artwork ?? this.artwork,
			artistName: artistName ?? this.artistName,
			url: url ?? this.url,
			discNumber: discNumber ?? this.discNumber,
			genreNames: genreNames ?? this.genreNames,
			durationInMillis: durationInMillis ?? this.durationInMillis,
			releaseDate: releaseDate ?? this.releaseDate,
			name: name ?? this.name,
			isrc: isrc ?? this.isrc,
			albumName: albumName ?? this.albumName,
			playParams: playParams ?? this.playParams,
			trackNumber: trackNumber ?? this.trackNumber,
			composerName: composerName ?? this.composerName,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! AppleMusic) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			previews.hashCode ^
			artwork.hashCode ^
			artistName.hashCode ^
			url.hashCode ^
			discNumber.hashCode ^
			genreNames.hashCode ^
			durationInMillis.hashCode ^
			releaseDate.hashCode ^
			name.hashCode ^
			isrc.hashCode ^
			albumName.hashCode ^
			playParams.hashCode ^
			trackNumber.hashCode ^
			composerName.hashCode;
}
