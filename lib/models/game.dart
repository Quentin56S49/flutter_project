import 'dart:ui';

class Game {
  String title;
  String description;
  Image? image;

  Game(this.title, this.description, [this.image]);

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      json['name'],
      json['summary'] ?? 'No description available',
    );
  }
}
