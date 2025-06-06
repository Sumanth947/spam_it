class Post {
  final String id;
  final String userId;
  final String username;
  final String userAvatar;
  final String caption;
  final List<String> imageUrls;
  final int likes;
  final List<Comment> comments;
  final DateTime createdAt;
  final bool isLiked;

  Post({
    required this.id,
    required this.userId,
    required this.username,
    required this.userAvatar,
    required this.caption,
    required this.imageUrls,
    required this.likes,
    required this.comments,
    required this.createdAt,
    this.isLiked = false,
  });

  Post copyWith({
    String? id,
    String? userId,
    String? username,
    String? userAvatar,
    String? caption,
    List<String>? imageUrls,
    int? likes,
    List<Comment>? comments,
    DateTime? createdAt,
    bool? isLiked,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      username: username ?? this.username,
      userAvatar: userAvatar ?? this.userAvatar,
      caption: caption ?? this.caption,
      imageUrls: imageUrls ?? this.imageUrls,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

class Comment {
  final String id;
  final String userId;
  final String username;
  final String text;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.userId,
    required this.username,
    required this.text,
    required this.createdAt,
  });
}