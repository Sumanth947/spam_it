class Contact {
  final String id;
  final String name;
  final String username;
  final String avatar;
  final String bio;
  final int followers;
  final int following;
  final bool isFollowing;
  final bool isVerified;

  Contact({
    required this.id,
    required this.name,
    required this.username,
    required this.avatar,
    required this.bio,
    required this.followers,
    required this.following,
    this.isFollowing = false,
    this.isVerified = false,
  });

  Contact copyWith({
    String? id,
    String? name,
    String? username,
    String? avatar,
    String? bio,
    int? followers,
    int? following,
    bool? isFollowing,
    bool? isVerified,
  }) {
    return Contact(
      id: id ?? this.id,
      name: name ?? this.name,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isFollowing: isFollowing ?? this.isFollowing,
      isVerified: isVerified ?? this.isVerified,
    );
  }
}