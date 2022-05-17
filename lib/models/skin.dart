import 'dart:convert';

class Skin {
  String id;
  int num;
  String name;
  bool chromas;

  Skin({
    required this.id,
    required this.num,
    required this.name,
    required this.chromas,
  });

  Skin copyWith({
    String? id,
    int? num,
    String? name,
    bool? chromas,
  }) {
    return Skin(
      id: id ?? this.id,
      num: num ?? this.num,
      name: name ?? this.name,
      chromas: chromas ?? this.chromas,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'num': num});
    result.addAll({'name': name});
    result.addAll({'chromas': chromas});

    return result;
  }

  factory Skin.fromMap(Map<String, dynamic> map) {
    return Skin(
      id: map['id'] ?? '',
      num: map['num']?.toInt() ?? 0,
      name: map['name'] ?? '',
      chromas: map['chromas'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Skin.fromJson(String source) => Skin.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Skin(id: $id, num: $num, name: $name, chromas: $chromas)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Skin &&
        other.id == id &&
        other.num == num &&
        other.name == name &&
        other.chromas == chromas;
  }

  @override
  int get hashCode {
    return id.hashCode ^ num.hashCode ^ name.hashCode ^ chromas.hashCode;
  }
}
