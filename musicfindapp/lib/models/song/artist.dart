import 'dart:convert';

import 'package:collection/collection.dart';

import 'external_urls.dart';

class Artist {
	ExternalUrls? externalUrls;
	String? href;
	String? id;
	String? name;
	String? type;
	String? uri;

	Artist({
		this.externalUrls, 
		this.href, 
		this.id, 
		this.name, 
		this.type, 
		this.uri, 
	});

	@override
	String toString() {
		return 'Artist(externalUrls: $externalUrls, href: $href, id: $id, name: $name, type: $type, uri: $uri)';
	}

	factory Artist.fromMap(Map<String, dynamic> data) => Artist(
				externalUrls: data['external_urls'] == null
						? null
						: ExternalUrls.fromMap(data['external_urls'] as Map<String, dynamic>),
				href: data['href'] as String?,
				id: data['id'] as String?,
				name: data['name'] as String?,
				type: data['type'] as String?,
				uri: data['uri'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'external_urls': externalUrls?.toMap(),
				'href': href,
				'id': id,
				'name': name,
				'type': type,
				'uri': uri,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Artist].
	factory Artist.fromJson(String data) {
		return Artist.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Artist] to a JSON string.
	String toJson() => json.encode(toMap());

	Artist copyWith({
		ExternalUrls? externalUrls,
		String? href,
		String? id,
		String? name,
		String? type,
		String? uri,
	}) {
		return Artist(
			externalUrls: externalUrls ?? this.externalUrls,
			href: href ?? this.href,
			id: id ?? this.id,
			name: name ?? this.name,
			type: type ?? this.type,
			uri: uri ?? this.uri,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Artist) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			externalUrls.hashCode ^
			href.hashCode ^
			id.hashCode ^
			name.hashCode ^
			type.hashCode ^
			uri.hashCode;
}
