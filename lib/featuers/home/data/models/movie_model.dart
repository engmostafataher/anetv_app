class MovieModel {
  final int id;
  final String title;
  final String content;
  final String? thumbnail;
  final String embedLink;
  final List<String> categories;
  final List<String> tags;
  final String type;

  MovieModel({
    required this.id,
    required this.title,
    required this.content,
    this.thumbnail,
    required this.embedLink,
    required this.categories,
    required this.tags,
    required this.type,
  });

  // Factory method to create a MovieModel from a JSON object
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      content: json['content'] ?? '',
      thumbnail: json['thumbnail'] != null && json['thumbnail'] != false
          ? json['thumbnail']
          : null,
      embedLink: json['embed_link'],
      categories: List<String>.from(json['categories']),
      tags: List<String>.from(json['tags']),
      type: json['type'],
    );
  }

  // Method to convert a MovieModel object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'thumbnail': thumbnail,
      'embed_link': embedLink,
      'categories': categories,
      'tags': tags,
      'type': type,
    };
  }
}


