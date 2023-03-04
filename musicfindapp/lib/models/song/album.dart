import 'dart:convert';

import 'package:collection/collection.dart';

import 'artist.dart';
import 'external_urls.dart';
import 'image.dart';

class Album {
	String? albumType;
	List<Artist>? artists;
	dynamic availableMarkets;
	ExternalUrls? externalUrls;
	String? href;
	String? id;
	List<Image>? images;
	String? name;
	String? releaseDate;
	String? releaseDatePrecision;
	int? totalTracks;
	String? type;
	String? uri;

	Album({
		this.albumType, 
		this.artists, 
		this.availableMarkets, 
		this.externalUrls, 
		this.href, 
		this.id, 
		this.images, 
		this.name, 
		this.releaseDate, 
		this.releaseDatePrecision, 
		this.totalTracks, 
		this.type, 
		this.uri, 
	});

	@override
	String toString() {
		return 'Album(albumType: $albumType, artists: $artists, availableMarkets: $availableMarkets, externalUrls: $externalUrls, href: $href, id: $id, images: $images, name: $name, releaseDate: $releaseDate, releaseDatePrecision: $releaseDatePrecision, totalTracks: $totalTracks, type: $type, uri: $uri)';
	}

	factory Album.fromMap(Map<String, dynamic> data) => Album(
				albumType: data['album_type'] as String?,
				artists: (data['artists'] as List<dynamic>?)
						?.map((e) => Artist.fromMap(e as Map<String, dynamic>))
						.toList(),
				availableMarkets: data['available_markets'] as dynamic,
				externalUrls: data['external_urls'] == null
						? null
						: ExternalUrls.fromMap(data['external_urls'] as Map<String, dynamic>),
				href: data['href'] as String?,
				id: data['id'] as String?,
				images: (data['images'] as List<dynamic>?)
						?.map((e) => Image.fromMap(e as Map<String, dynamic>))
						.toList(),
				name: data['name'] as String?,
				releaseDate: data['release_date'] as String?,
				releaseDatePrecision: data['release_date_precision'] as String?,
				totalTracks: data['total_tracks'] as int?,
				type: data['type'] as String?,
				uri: data['uri'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'album_type': albumType,
				'artists': artists?.map((e) => e.toMap()).toList(),
				'available_markets': availableMarkets,
				'external_urls': externalUrls?.toMap(),
				'href': href,
				'id': id,
				'images': images?.map((e) => e.toMap()).toList(),
				'name': name,
				'release_date': releaseDate,
				'release_date_precision': releaseDatePrecision,
				'total_tracks': totalTracks,
				'type': type,
				'uri': uri,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Album].
	factory Album.fromJson(String data) {
		return Album.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Album] to a JSON string.
	String toJson() => json.encode(toMap());

	Album copyWith({
		String? albumType,
		List<Artist>? artists,
		dynamic availableMarkets,
		ExternalUrls? externalUrls,
		String? href,
		String? id,
		List<Image>? images,
		String? name,
		String? releaseDate,
		String? releaseDatePrecision,
		int? totalTracks,
		String? type,
		String? uri,
	}) {
		return Album(
			albumType: albumType ?? this.albumType,
			artists: artists ?? this.artists,
			availableMarkets: availableMarkets ?? this.availableMarkets,
			externalUrls: externalUrls ?? this.externalUrls,
			href: href ?? this.href,
			id: id ?? this.id,
			images: images ?? this.images,
			name: name ?? this.name,
			releaseDate: releaseDate ?? this.releaseDate,
			releaseDatePrecision: releaseDatePrecision ?? this.releaseDatePrecision,
			totalTracks: totalTracks ?? this.totalTracks,
			type: type ?? this.type,
			uri: uri ?? this.uri,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Album) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			albumType.hashCode ^
			artists.hashCode ^
			availableMarkets.hashCode ^
			externalUrls.hashCode ^
			href.hashCode ^
			id.hashCode ^
			images.hashCode ^
			name.hashCode ^
			releaseDate.hashCode ^
			releaseDatePrecision.hashCode ^
			totalTracks.hashCode ^
			type.hashCode ^
			uri.hashCode;
}
