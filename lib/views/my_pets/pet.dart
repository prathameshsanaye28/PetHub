class Pet {
  String name;
  String breed;
  String age;
  String image;

  Pet(this.name, this.breed, this.age, this.image);

  // Convert a Pet object into a Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'breed': breed,
      'age': age,
      'image': image,
    };
  }

  // Create a Pet object from a Map
  static Pet fromMap(Map<String, dynamic> map) {
    return Pet(
      map['name'],
      map['breed'],
      map['age'],
      map['image'],
    );
  }
}



