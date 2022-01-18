
class CommentModel {
  final String id;
  final String userId;
  final String comment;
  final String postId;
  final List<int> likes;

  CommentModel({
    required this.id,
    required this.userId,
    required this.comment,
    required this.postId,
    required this.likes,
  });
}
