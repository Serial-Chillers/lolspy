import 'dart:convert';

import 'package:lolspy/models/models.dart';

class Passive {
  final String name;
  final String description;
  final Image image;

  Passive({
    required this.name,
    required this.description,
    required this.image,
  });

  Passive copyWith({
    String? name,
    String? description,
    Image? image,
  }) {
    return Passive(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'image': image.toMap()});

    return result;
  }

  factory Passive.fromMap(Map<String, dynamic> map) {
    return Passive(
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      image: Image.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Passive.fromJson(String source) =>
      Passive.fromMap(json.decode(source));

  @override
  String toString() =>
      'Passive(name: $name, description: $description, image: $image)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Passive &&
        other.name == name &&
        other.description == description &&
        other.image == image;
  }

  @override
  int get hashCode => name.hashCode ^ description.hashCode ^ image.hashCode;
}
