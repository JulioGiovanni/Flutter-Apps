import 'dart:convert';

import 'package:collection/collection.dart';

import 'result.dart';

class Song {
	String? status;
	Result? result;

	Song({this.status, this.result});

	@override
	String toString() => 'Song(status: $status, result: $result)';

	factory Song.fromMap(Map<String, dynamic> data) => Song(
				status: data['status'] as String?,
				result: data['result'] == null
						? null
						: Result.fromMap(data['result'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'status': status,
				'result': result?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Song].
	factory Song.fromJson(String data) {
		return Song.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Song] to a JSON string.
	String toJson() => json.encode(toMap());

	Song copyWith({
		String? status,
		Result? result,
	}) {
		return Song(
			status: status ?? this.status,
			result: result ?? this.result,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Song) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => status.hashCode ^ result.hashCode;
}
