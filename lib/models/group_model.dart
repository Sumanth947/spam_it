class Group {
  final String id;
  final String name;
  final String description;
  final String coverImage;
  final List<String> memberIds;
  final String adminId;
  final DateTime createdAt;
  final bool isPublic;
  final String category;

  Group({
    required this.id,
    required this.name,
    required this.description,
    required this.coverImage,
    required this.memberIds,
    required this.adminId,
    required this.createdAt,
    this.isPublic = true,
    required this.category,
  });

  int get memberCount => memberIds.length;

  Group copyWith({
    String? id,
    String? name,
    String? description,
    String? coverImage,
    List<String>? memberIds,
    String? adminId,
    DateTime? createdAt,
    bool? isPublic,
    String? category,
  }) {
    return Group(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      memberIds: memberIds ?? this.memberIds,
      adminId: adminId ?? this.adminId,
      createdAt: createdAt ?? this.createdAt,
      isPublic: isPublic ?? this.isPublic,
      category: category ?? this.category,
    );
  }
}