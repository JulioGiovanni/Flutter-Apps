import 'dart:convert';

import 'package:collection/collection.dart';

class ExternalUrls {
	String? spotify;

	ExternalUrls({this.spotify});

	@override
	String toString() => 'ExternalUrls(spotify: $spotify)';

	factory ExternalUrls.fromMap(Map<String, dynamic> data) => ExternalUrls(
				spotify: data['spotify'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'spotify': spotify,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExternalUrls].
	factory ExternalUrls.fromJson(String data) {
		return ExternalUrls.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ExternalUrls] to a JSON string.
	String toJson() => json.encode(toMap());

	ExternalUrls copyWith({
		String? spotify,
	}) {
		return ExternalUrls(
			spotify: spotify ?? this.spotify,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ExternalUrls) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => spotify.hashCode;
}
