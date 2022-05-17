import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:lolspy/models/spell.dart';

import 'models.dart';

class Champion {
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Image image;
  final List<Skin?>? skins;
  final List<Spell?>? spells;

  Champion({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
    this.skins,
    this.spells,
  });

  Champion copyWith({
    String? id,
    String? key,
    String? name,
    String? title,
    String? blurb,
    Image? image,
    List<Skin?>? skins,
    List<Spell?>? spells,
  }) {
    return Champion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
      image: image ?? this.image,
      skins: skins ?? this.skins,
      spells: spells ?? this.spells,
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
    if (skins != null) {
      result.addAll({'skins': skins!.map((x) => x?.toMap()).toList()});
    }
    if (spells != null) {
      result.addAll({'spells': spells!.map((x) => x?.toMap()).toList()});
    }

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
      skins: map['skins'] != null
          ? List<Skin?>.from(map['skins']?.map((x) => Skin?.fromMap(x)))
          : null,
      spells: map['spells'] != null
          ? List<Spell?>.from(map['spells']?.map((x) => Spell?.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(id: $id, key: $key, name: $name, title: $title, blurb: $blurb, image: $image, skins: $skins, spells: $spells)';
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
        other.image == image &&
        listEquals(other.skins, skins) &&
        listEquals(other.spells, spells);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode ^
        image.hashCode ^
        skins.hashCode ^
        spells.hashCode;
  }
}
