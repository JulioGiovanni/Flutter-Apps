import 'dart:convert';

import 'package:collection/collection.dart';

class Image {
	int? height;
	String? url;
	int? width;

	Image({this.height, this.url, this.width});

	@override
	String toString() => 'Image(height: $height, url: $url, width: $width)';

	factory Image.fromMap(Map<String, dynamic> data) => Image(
				height: data['height'] as int?,
				url: data['url'] as String?,
				width: data['width'] as int?,
			);

	Map<String, dynamic> toMap() => {
				'height': height,
				'url': url,
				'width': width,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Image].
	factory Image.fromJson(String data) {
		return Image.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Image] to a JSON string.
	String toJson() => json.encode(toMap());

	Image copyWith({
		int? height,
		String? url,
		int? width,
	}) {
		return Image(
			height: height ?? this.height,
			url: url ?? this.url,
			width: width ?? this.width,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Image) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode => height.hashCode ^ url.hashCode ^ width.hashCode;
}
