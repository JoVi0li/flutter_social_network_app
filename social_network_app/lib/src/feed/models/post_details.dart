import 'package:social_network_app/src/feed/models/comment_model.dart';
import 'package:social_network_app/src/feed/models/post_model.dart';

class PostDetailsModel {
  final PostModel post;
    final List<CommentModel> comments;

  PostDetailsModel( {
    required this.post,
    required this.comments,
  });

}
