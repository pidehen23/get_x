class Dog {
  int? id;
  String? name;
  int? age;

  Dog({this.id, this.name, this.age});

  Dog.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['age'] = age;
    return data;
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  // 重写 toString 方法，以便使用 print 方法查看每个狗狗信息的时候能更清晰。
  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $age}';
  }
}
