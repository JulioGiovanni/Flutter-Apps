import 'dart:convert';

import 'package:collection/collection.dart';

class PlayParams {
	String? id;
	String? kind;

	PlayParams({this.id, this.kind});

	@override
	String toString() => 'PlayParams(id: $id, kind: $kind)';

	factory PlayParams.fromMap(Map<String, dynamic> data) => PlayParams(
				id: data['id'] as String?,
				kind: data['kind'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'kind': kind,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlayParams].
	factory PlayParams.fromJson(String data) {
		return PlayParams.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [PlayParams] to a JSON string.
	String toJson() => json.encode(toMap());

	PlayParams copyWith({
		String? id,
		String? kind,
	}) {
		return PlayParams(
			id: id ?? this.id,
			kind: kind ?? this.kind,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! PlayParams) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => id.hashCode ^ kind.hashCode;
}
