class Player {
  String name;
  String pseudo;
  int score;
  Player({required this.name, required this.pseudo, this.score = 0});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'pseudo': pseudo,
      'score': score,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      name: json['name'],
      pseudo: json['pseudo'],
      score: json['score'],
    );
  }

  Player copyWith({String? name, String? pseudo, int? score}) {
    return Player(
      name: name ?? this.name,
      pseudo: pseudo ?? this.pseudo,
      score: score ?? this.score,
    );
  }
}
