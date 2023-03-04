import 'dart:convert';

import 'package:collection/collection.dart';

class Artwork {
	int? width;
	int? height;
	String? url;
	String? bgColor;
	String? textColor1;
	String? textColor2;
	String? textColor3;
	String? textColor4;

	Artwork({
		this.width, 
		this.height, 
		this.url, 
		this.bgColor, 
		this.textColor1, 
		this.textColor2, 
		this.textColor3, 
		this.textColor4, 
	});

	@override
	String toString() {
		return 'Artwork(width: $width, height: $height, url: $url, bgColor: $bgColor, textColor1: $textColor1, textColor2: $textColor2, textColor3: $textColor3, textColor4: $textColor4)';
	}

	factory Artwork.fromMap(Map<String, dynamic> data) => Artwork(
				width: data['width'] as int?,
				height: data['height'] as int?,
				url: data['url'] as String?,
				bgColor: data['bgColor'] as String?,
				textColor1: data['textColor1'] as String?,
				textColor2: data['textColor2'] as String?,
				textColor3: data['textColor3'] as String?,
				textColor4: data['textColor4'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'width': width,
				'height': height,
				'url': url,
				'bgColor': bgColor,
				'textColor1': textColor1,
				'textColor2': textColor2,
				'textColor3': textColor3,
				'textColor4': textColor4,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Artwork].
	factory Artwork.fromJson(String data) {
		return Artwork.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Artwork] to a JSON string.
	String toJson() => json.encode(toMap());

	Artwork copyWith({
		int? width,
		int? height,
		String? url,
		String? bgColor,
		String? textColor1,
		String? textColor2,
		String? textColor3,
		String? textColor4,
	}) {
		return Artwork(
			width: width ?? this.width,
			height: height ?? this.height,
			url: url ?? this.url,
			bgColor: bgColor ?? this.bgColor,
			textColor1: textColor1 ?? this.textColor1,
			textColor2: textColor2 ?? this.textColor2,
			textColor3: textColor3 ?? this.textColor3,
			textColor4: textColor4 ?? this.textColor4,
		);
	}

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! Artwork) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			width.hashCode ^
			height.hashCode ^
			url.hashCode ^
			bgColor.hashCode ^
			textColor1.hashCode ^
			textColor2.hashCode ^
			textColor3.hashCode ^
			textColor4.hashCode;
}
