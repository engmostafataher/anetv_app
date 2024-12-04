class MovieModel {
	int? id;
	String? title;
	String? content;
	String? thumbnail;
	String? embedLink;
	List<String>? categories;
	List<dynamic>? tags;
	String? type;

	MovieModel({
		this.id, 
		this.title, 
		this.content, 
		this.thumbnail, 
		this.embedLink, 
		this.categories, 
		this.tags, 
		this.type, 
	});

	factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
				id: json['id'] as int?,
				title: json['title'] as String?,
				content: json['content'] as String?,
				thumbnail: json['thumbnail'] as String?,
				embedLink: json['embed_link'] as String?,
				categories: json['categories'] as List<String>?,
				tags: json['tags'] as List<dynamic>?,
				type: json['type'] as String?,
			);


}
