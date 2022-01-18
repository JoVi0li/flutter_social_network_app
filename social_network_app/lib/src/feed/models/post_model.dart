
class PostModel {
  final String id;
  final String userId;
  final String image;
  final String legend;
  final List<int> likes;

  PostModel({
    required this.id,
    required this.userId,
    required this.image,
    required this.legend,
    required this.likes,
  });
}
