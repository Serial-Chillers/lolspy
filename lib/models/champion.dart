import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'models.dart';

class Champion {
  final String id;
  final String key;
  final String name;
  final String title;
  final String blurb;
  final Image image;
  final String? lore;
  final List<Skin>? skins;
  final List<Spell>? spells;
  final Passive? passive;
  final List<String?>? allytips;
  final List<String?>? enemytips;

  Champion({
    required this.id,
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
    required this.image,
    required this.lore,
    this.skins,
    this.spells,
    this.passive,
    this.allytips,
    this.enemytips,
  });

  Champion copyWith({
    String? id,
    String? key,
    String? name,
    String? title,
    String? blurb,
    Image? image,
    String? lore,
    List<Skin>? skins,
    List<Spell>? spells,
    Passive? passive,
    List<String?>? allytips,
    List<String?>? enemytips,
  }) {
    return Champion(
      id: id ?? this.id,
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
      image: image ?? this.image,
      lore: lore ?? this.lore,
      skins: skins ?? this.skins,
      spells: spells ?? this.spells,
      passive: passive ?? this.passive,
      allytips: allytips ?? this.allytips,
      enemytips: enemytips ?? this.enemytips,
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
    if (lore != null) {
      result.addAll({'lore': lore});
    }
    if (skins != null) {
      result.addAll({'skins': skins!.map((x) => x?.toMap()).toList()});
    }
    if (spells != null) {
      result.addAll({'spells': spells!.map((x) => x?.toMap()).toList()});
    }
    if (passive != null) {
      result.addAll({'passive': passive!.toMap()});
    }
    if (allytips != null) {
      result.addAll({'allytips': allytips!.map((x) => x).toList()});
    }
    if (enemytips != null) {
      result.addAll({'enemytips': enemytips!.map((x) => x).toList()});
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
      lore: map['lore'],
      skins: map['skins'] != null
          ? List<Skin>.from(map['skins']?.map((x) => Skin.fromMap(x)))
          : null,
      spells: map['spells'] != null
          ? List<Spell>.from(map['spells']?.map((x) => Spell.fromMap(x)))
          : null,
      passive: map['passive'] != null ? Passive.fromMap(map['passive']) : null,
      allytips: map['allytips'] != null
          ? List<String?>.from(map['allytips']?.map((x) => x))
          : null,
      enemytips: map['enemytips'] != null
          ? List<String?>.from(map['enemytips']?.map((x) => x))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(id: $id, key: $key, name: $name, title: $title, blurb: $blurb, image: $image, lore: $lore, skins: $skins, spells: $spells, passive: $passive, allytips: $allytips, enemytips: $enemytips)';
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
        other.lore == lore &&
        listEquals(other.skins, skins) &&
        listEquals(other.spells, spells) &&
        other.passive == passive &&
        listEquals(other.allytips, allytips) &&
        listEquals(other.enemytips, enemytips);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        key.hashCode ^
        name.hashCode ^
        title.hashCode ^
        blurb.hashCode ^
        image.hashCode ^
        lore.hashCode ^
        skins.hashCode ^
        spells.hashCode ^
        passive.hashCode ^
        allytips.hashCode ^
        enemytips.hashCode;
  }
}
