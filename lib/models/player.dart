class Player {
  String name;
  String pseudo;

  Player({required this.name, required this.pseudo});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pseudo': pseudo,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      pseudo: json['pseudo'],
    );
  }
}
