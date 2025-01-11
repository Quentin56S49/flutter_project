class Game {
  String title;
  String description;
  String coverUrl;

  Game({required this.title, required this.description, this.coverUrl = ''});

  factory Game.fromJsonAPI(Map<String, dynamic> json) {
    return Game(
      title: json['name'] ?? 'No title available',
      description: json['summary'] ?? 'No description available',
      coverUrl: json['cover'] != null
          ? 'https://images.igdb.com/igdb/image/upload/t_cover_big/${json['cover']['image_id']}.jpg'
          : '',
    );
  }

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      title: json['title'] ?? 'No title available',
      description: json['description'] ?? 'No description available',
      coverUrl: json['coverUrl'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'coverUrl': coverUrl,
    };
  }
}
