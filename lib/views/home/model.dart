class Character{
  String name;
  String birthday;
  List<String> jobs;
  String img;
  String nickname;
  List<int> appearance;
  String actorName;

  Character.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    birthday = json['birthday'];
    jobs = json['occupation'].cast<String>();
    img = json['img'];
    nickname = json['nickname'];
    appearance = json['appearance'].cast<int>();
    actorName = json['portrayed'];

  }
}