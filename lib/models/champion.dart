import 'dart:convert';

class Champion {
  final String key;
  final String name;
  final String title;
  final String blurb;
  Champion({
    required this.key,
    required this.name,
    required this.title,
    required this.blurb,
  });

  Champion copyWith({
    String? key,
    String? name,
    String? title,
    String? blurb,
  }) {
    return Champion(
      key: key ?? this.key,
      name: name ?? this.name,
      title: title ?? this.title,
      blurb: blurb ?? this.blurb,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'key': key});
    result.addAll({'name': name});
    result.addAll({'title': title});
    result.addAll({'blurb': blurb});

    return result;
  }

  factory Champion.fromMap(Map<String, dynamic> map) {
    return Champion(
      key: map['key'] ?? '',
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      blurb: map['blurb'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Champion.fromJson(String source) =>
      Champion.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Champion(key: $key, name: $name, title: $title, blurb: $blurb)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Champion &&
        other.key == key &&
        other.name == name &&
        other.title == title &&
        other.blurb == blurb;
  }

  @override
  int get hashCode {
    return key.hashCode ^ name.hashCode ^ title.hashCode ^ blurb.hashCode;
  }
}
