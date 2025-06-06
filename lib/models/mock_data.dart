import '../models/post_model.dart';
import '../models/contact_model.dart';
import '../models/group_model.dart';

class MockData {
  static final Map<String, dynamic> profileData = {
    'username': 'john_doe',
    'fullName': 'John Doe',
    'bio': 'Photographer | Traveler | Coffee lover ☕',
    'memories': posts.length,
    'groups': groups.length,
    'years': ['2023', '2024', '2025'],
    'posts': posts.map((post) => {
          'image': post.imageUrls[0],
          'year': post.createdAt.year.toString(),
        }).toList(),
  };

  static List<Post> posts = [
    Post(
      id: '1',
      userId: '1',
      username: 'john_doe',
      userAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      caption: 'Beautiful sunset at the beach! 🌅 #sunset #beach #nature',
      imageUrls: ['https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop'],
      likes: 245,
      comments: [
        Comment(
          id: '1',
          userId: '2',
          username: 'jane_smith',
          text: 'Amazing shot! 📸',
          createdAt: DateTime.now().subtract(Duration(hours: 2)),
        ),
        Comment(
          id: '2',
          userId: '3',
          username: 'mike_wilson',
          text: 'Love this place! Where is it?',
          createdAt: DateTime.now().subtract(Duration(hours: 1)),
        ),
      ],
      createdAt: DateTime(2023, 10, 15),
      isLiked: true,
    ),
    Post(
      id: '2',
      userId: '2',
      username: 'jane_smith',
      userAvatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      caption: 'Coffee time ☕ Starting the day right!',
      imageUrls: ['https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&h=400&fit=crop'],
      likes: 128,
      comments: [
        Comment(
          id: '3',
          userId: '1',
          username: 'john_doe',
          text: 'Looks delicious!',
          createdAt: DateTime.now().subtract(Duration(minutes: 30)),
        ),
      ],
      createdAt: DateTime(2024, 5, 20),
      isLiked: false,
    ),
    Post(
      id: '3',
      userId: '3',
      username: 'mike_wilson',
      userAvatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      caption: 'Adventure awaits! 🏔️ #hiking #mountains #adventure',
      imageUrls: ['https://images.unsplash.com/photo-1551632811-561732d1e306?w=400&h=400&fit=crop'],
      likes: 89,
      comments: [],
      createdAt: DateTime(2025, 2, 10),
      isLiked: true,
    ),
  ];

  static List<Contact> contacts = [
    Contact(
      id: '1',
      name: 'John Doe',
      username: 'john_doe',
      avatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      bio: 'Photographer | Traveler | Coffee lover ☕',
      followers: 1234,
      following: 567,
      isFollowing: false,
      isVerified: true,
    ),
    Contact(
      id: '2',
      name: 'Jane Smith',
      username: 'jane_smith',
      avatar: 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      bio: 'Designer | Art enthusiast | Dog mom 🐕',
      followers: 890,
      following: 234,
      isFollowing: true,
      isVerified: false,
    ),
    Contact(
      id: '3',
      name: 'Mike Wilson',
      username: 'mike_wilson',
      avatar: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      bio: 'Adventure seeker | Hiker | Nature lover 🌲',
      followers: 456,
      following: 123,
      isFollowing: false,
      isVerified: false,
    ),
  ];

  static List<Group> groups = [
    Group(
      id: '1',
      name: 'Photography Enthusiasts',
      description: 'A community for photographers to share their work and tips',
      coverImage: 'https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=400&h=200&fit=crop',
      memberIds: ['1', '2', '3', '4', '5'],
      adminId: '1',
      createdAt: DateTime.now().subtract(Duration(days: 30)),
      isPublic: true,
      category: 'Photography',
    ),
    Group(
      id: '2',
      name: 'Hiking Adventures',
      description: 'Join us for amazing hiking trails and outdoor adventures',
      coverImage: 'https://images.unsplash.com/photo-1551632811-561732d1e306?w=400&h=200&fit=crop',
      memberIds: ['2', '3', '6', '7'],
      adminId: '3',
      createdAt: DateTime.now().subtract(Duration(days: 15)),
      isPublic: true,
      category: 'Outdoor',
    ),
  ];

  static List<String> storyHighlights = [
    'Travel',
    'Food',
    'Work',
    'Friends',
    'Pets',
  ];

  static List<String> recentSearches = [
    'john_doe',
    'jane_smith',
    'photography',
    'travel',
    'food',
  ];

  static List<Map<String, dynamic>> notifications = [
    {
      'id': '1',
      'type': 'like',
      'user': 'jane_smith',
      'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face',
      'message': 'liked your memory',
      'time': '2 minutes ago',
      'isRead': false,
    },
    {
      'id': '2',
      'type': 'follow',
      'user': 'mike_wilson',
      'avatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150&h=150&fit=crop&crop=face',
      'message': 'joined your group',
      'time': '1 hour ago',
      'isRead': false,
    },
    {
      'id': '3',
      'type': 'comment',
      'user': 'john_doe',
      'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
      'message': 'commented on your memory',
      'time': '3 hours ago',
      'isRead': true,
    },
  ];
}