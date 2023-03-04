import 'dart:convert';

import 'package:collection/collection.dart';

class Preview {
	String? url;

	Preview({this.url});

	@override
	String toString() => 'Preview(url: $url)';

	factory Preview.fromMap(Map<String, dynamic> data) => Preview(
				url: data['url'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'url': url,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Preview].
	factory Preview.fromJson(String data) {
		return Preview.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Preview] to a JSON string.
	String toJson() => json.encode(toMap());

	Preview copyWith({
		String? url,
	}) {
		return Preview(
			url: url ?? this.url,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Preview) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => url.hashCode;
}
