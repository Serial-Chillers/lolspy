import 'dart:convert';

import 'models.dart';

class Champion {
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Image image;

  Champion({
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
  });

  Champion copyWith({
    String? key,
    String? name,
    String? title,
    String? blurb,
    Image? image,
  }) {
    return Champion(
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'key': key});
    result.addAll({'name': name});
    result.addAll({'title': title});
    result.addAll({'blurb': blurb});
    result.addAll({'image': image.toMap()});

    return result;
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      blurb: map['blurb'] ?? '',
      image: Image.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(key: $key, name: $name, title: $title, blurb: $blurb, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Champion &&
        other.key == key &&
        other.name == name &&
        other.title == title &&
        other.blurb == blurb &&
        other.image == image;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode ^
        image.hashCode;
  }
}
