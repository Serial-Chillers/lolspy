import 'dart:convert';

import 'models.dart';

class Spell {
  final String id;
  final String name;
  final String description;
  final String tooltip;
  final Image image;

  Spell({
    required this.id,
    required this.name,
    required this.description,
    required this.tooltip,
    required this.image,
  });

  Spell copyWith({
    String? id,
    String? name,
    String? description,
    String? tooltip,
    Image? image,
  }) {
    return Spell(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      tooltip: tooltip ?? this.tooltip,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    result.addAll({'tooltip': tooltip});
    result.addAll({'image': image.toMap()});

    return result;
  }

  factory Spell.fromMap(Map<String, dynamic> map) {
    return Spell(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      tooltip: map['tooltip'] ?? '',
      image: Image.fromMap(map['image']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Spell.fromJson(String source) => Spell.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Spell(id: $id, name: $name, description: $description, tooltip: $tooltip, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Spell &&
        other.id == id &&
        other.name == name &&
        other.description == description &&
        other.tooltip == tooltip &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        tooltip.hashCode ^
        image.hashCode;
  }
}
