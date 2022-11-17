import 'dart:convert';

class Student {
  String name; 

  Student({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'] ?? '',
    );
  }


  Student copyWith({
    String? name,
  }) {
    return Student(
      name: name ?? this.name,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source));

  @override
  String toString() => 'Student(name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Student &&
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
