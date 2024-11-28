import 'dart:convert';

void main() {
  String easyJson = """
  {
	"name": "오상구",
	"age": 7,
	"isMale" : true
}
  """;
  // 1.String을 -> Map 형태로 만든다.
  Map<String, dynamic> easyMap = jsonDecode(easyJson);
  // 3.Map -> class 객체로 바꾼다.
  Pet pet = Pet.fromJson(easyMap);
  print(pet.toJson());

  String hardJson = """
{
	"name": "오상구",
	"age": 7,
	"isMale" : true,
	"favorite_foods" : ["삼겹살", "연어", "고구마"],
	"contact": {
		"mobile": "010-0000-0000",
		"email": null
	}
}
""";
// 1. jsonString을 Map 형태로 바꾼다.
  Map hardMap = jsonDecode(hardJson);

// 3. class로 정의했으니 객체로 만든다(Map을)
}

// 2. 객체로 바꾸기 위해 class를 정의한다.
class PetDetail {
  String name;
  int age;
  bool isMale;
  List<String> favoriteFoods;
  Contact contact;

  PetDetail({
    required this.name,
    required this.age,
    required this.isMale,
    required this.favoriteFoods,
    required this.contact,
  });
//fromJson 네임드 생성자
  PetDetail.fromJson(Map<String, dynamic> map)
      : this(
          name: map['name'],
          age: map['age'],
          isMale: map['isMale'],
          favoriteFoods: map['favoritFoods'],
          contact: Contact.fromJson(
            map['contact'],
          ),
        );
}

class Contact {
  String mobile;
  String? email;

  Contact({
    required this.email,
    required this.mobile,
  });
  // Contact. fromJson 네임드 생성자 만들기
  Contact.fromJson(Map<String, dynamic> map)
      : this(
          mobile: map['mobile'],
          email: map['email'],
        );
// toJson 메서드 만들기
  Map<String, dynamic> toJson() {
    return {
      'mobile': mobile,
      'email': email,
    };
  }
}

// 2. 클래스를 정의한다.

// name,age,isMale
class Pet {
  String name;
  int age;
  bool isMale;

  Pet({
    required this.name,
    required this.age,
    required this.isMale,
  });

// fromJson named생성자 만들기
  Pet.fromJson(Map<String, dynamic> map)
      : this(
          name: map['name'],
          age: map['age'],
          isMale: map['isMale'],
        );
// Map<String, dynamic> tojson  만들기
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'isMale': isMale,
    };
  }
}
