import 'dart:convert';

import 'package:collection/collection.dart';

class ExternalIds {
	String? isrc;

	ExternalIds({this.isrc});

	@override
	String toString() => 'ExternalIds(isrc: $isrc)';

	factory ExternalIds.fromMap(Map<String, dynamic> data) => ExternalIds(
				isrc: data['isrc'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'isrc': isrc,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ExternalIds].
	factory ExternalIds.fromJson(String data) {
		return ExternalIds.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [ExternalIds] to a JSON string.
	String toJson() => json.encode(toMap());

	ExternalIds copyWith({
		String? isrc,
	}) {
		return ExternalIds(
			isrc: isrc ?? this.isrc,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ExternalIds) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => isrc.hashCode;
}
