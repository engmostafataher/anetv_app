class CatogryItmeModel {

  final String image;
  final String title;

  // Constructor
  CatogryItmeModel({
    required this.image,
    required this.title,
  });

  // Factory Constructor لتحويل JSON إلى كائن
  factory CatogryItmeModel.fromJson(Map<String, dynamic> json) {
    return CatogryItmeModel(
      image: json['image'] ?? '', // تأكد من وجود قيمة أو استخدم قيمة افتراضية
      title: json['title'] ?? '', 
    );
  }

  // تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'title': title,
    };
  }
}


