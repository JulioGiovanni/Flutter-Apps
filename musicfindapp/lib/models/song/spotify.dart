import 'dart:convert';

import 'package:collection/collection.dart';

import 'album.dart';
import 'artist.dart';
import 'external_ids.dart';
import 'external_urls.dart';

class Spotify {
	Album? album;
	List<Artist>? artists;
	dynamic availableMarkets;
	int? discNumber;
	int? durationMs;
	bool? explicit;
	ExternalIds? externalIds;
	ExternalUrls? externalUrls;
	String? href;
	String? id;
	bool? isLocal;
	String? name;
	int? popularity;
	int? trackNumber;
	String? type;
	String? uri;

	Spotify({
		this.album, 
		this.artists, 
		this.availableMarkets, 
		this.discNumber, 
		this.durationMs, 
		this.explicit, 
		this.externalIds, 
		this.externalUrls, 
		this.href, 
		this.id, 
		this.isLocal, 
		this.name, 
		this.popularity, 
		this.trackNumber, 
		this.type, 
		this.uri, 
	});

	@override
	String toString() {
		return 'Spotify(album: $album, artists: $artists, availableMarkets: $availableMarkets, discNumber: $discNumber, durationMs: $durationMs, explicit: $explicit, externalIds: $externalIds, externalUrls: $externalUrls, href: $href, id: $id, isLocal: $isLocal, name: $name, popularity: $popularity, trackNumber: $trackNumber, type: $type, uri: $uri)';
	}

	factory Spotify.fromMap(Map<String, dynamic> data) => Spotify(
				album: data['album'] == null
						? null
						: Album.fromMap(data['album'] as Map<String, dynamic>),
				artists: (data['artists'] as List<dynamic>?)
						?.map((e) => Artist.fromMap(e as Map<String, dynamic>))
						.toList(),
				availableMarkets: data['available_markets'] as dynamic,
				discNumber: data['disc_number'] as int?,
				durationMs: data['duration_ms'] as int?,
				explicit: data['explicit'] as bool?,
				externalIds: data['external_ids'] == null
						? null
						: ExternalIds.fromMap(data['external_ids'] as Map<String, dynamic>),
				externalUrls: data['external_urls'] == null
						? null
						: ExternalUrls.fromMap(data['external_urls'] as Map<String, dynamic>),
				href: data['href'] as String?,
				id: data['id'] as String?,
				isLocal: data['is_local'] as bool?,
				name: data['name'] as String?,
				popularity: data['popularity'] as int?,
				trackNumber: data['track_number'] as int?,
				type: data['type'] as String?,
				uri: data['uri'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'album': album?.toMap(),
				'artists': artists?.map((e) => e.toMap()).toList(),
				'available_markets': availableMarkets,
				'disc_number': discNumber,
				'duration_ms': durationMs,
				'explicit': explicit,
				'external_ids': externalIds?.toMap(),
				'external_urls': externalUrls?.toMap(),
				'href': href,
				'id': id,
				'is_local': isLocal,
				'name': name,
				'popularity': popularity,
				'track_number': trackNumber,
				'type': type,
				'uri': uri,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Spotify].
	factory Spotify.fromJson(String data) {
		return Spotify.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Spotify] to a JSON string.
	String toJson() => json.encode(toMap());

	Spotify copyWith({
		Album? album,
		List<Artist>? artists,
		dynamic availableMarkets,
		int? discNumber,
		int? durationMs,
		bool? explicit,
		ExternalIds? externalIds,
		ExternalUrls? externalUrls,
		String? href,
		String? id,
		bool? isLocal,
		String? name,
		int? popularity,
		int? trackNumber,
		String? type,
		String? uri,
	}) {
		return Spotify(
			album: album ?? this.album,
			artists: artists ?? this.artists,
			availableMarkets: availableMarkets ?? this.availableMarkets,
			discNumber: discNumber ?? this.discNumber,
			durationMs: durationMs ?? this.durationMs,
			explicit: explicit ?? this.explicit,
			externalIds: externalIds ?? this.externalIds,
			externalUrls: externalUrls ?? this.externalUrls,
			href: href ?? this.href,
			id: id ?? this.id,
			isLocal: isLocal ?? this.isLocal,
			name: name ?? this.name,
			popularity: popularity ?? this.popularity,
			trackNumber: trackNumber ?? this.trackNumber,
			type: type ?? this.type,
			uri: uri ?? this.uri,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Spotify) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			album.hashCode ^
			artists.hashCode ^
			availableMarkets.hashCode ^
			discNumber.hashCode ^
			durationMs.hashCode ^
			explicit.hashCode ^
			externalIds.hashCode ^
			externalUrls.hashCode ^
			href.hashCode ^
			id.hashCode ^
			isLocal.hashCode ^
			name.hashCode ^
			popularity.hashCode ^
			trackNumber.hashCode ^
			type.hashCode ^
			uri.hashCode;
}
