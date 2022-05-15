import 'dart:convert';

import 'models.dart';

class Champion {
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Image image;

  Champion({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
  });

  Champion copyWith({
    String? id,
    String? key,
    String? name,
    String? title,
    String? blurb,
    Image? image,
  }) {
    return Champion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'key': key});
    result.addAll({'name': name});
    result.addAll({'title': title});
    result.addAll({'blurb': blurb});
    result.addAll({'image': image.toMap()});

    return result;
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      id: map['id'] ?? '',
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
    return 'Champion(id: $id, key: $key, name: $name, title: $title, blurb: $blurb, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Champion &&
        other.id == id &&
        other.key == key &&
        other.name == name &&
        other.title == title &&
        other.blurb == blurb &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode ^
        image.hashCode;
  }
}
