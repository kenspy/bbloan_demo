class HomeModel {
  final int id;
  final String title;
  final String path;

  HomeModel({
    required this.id,
    required this.title,
    required this.path,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json['id'],
      title: json['title'],
      path: json['path'],
    );
  }
}
