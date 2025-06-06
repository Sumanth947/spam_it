import 'package:flutter/material.dart';
import '../models/contact_model.dart';
import '../models/post_model.dart';

class MockData {
  static List<Map<String, dynamic>> get notifications => [
        {
          'user': 'John Doe',
          'message': 'liked your post',
          'time': '2h ago',
          'avatar': 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
          'type': 'like',
          'isRead': false,
        },
        {
          'user': 'Jane Smith',
          'message': 'commented on your post',
          'time': '5h ago',
          'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop&crop=face',
          'type': 'comment',
          'isRead': false,
        },
        {
          'user': 'Mike Johnson',
          'message': 'started following you',
          'time': '1d ago',
          'avatar': 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150&h=150&fit=crop&crop=face',
          'type': 'follow',
          'isRead': false,
        },
      ];

  static List<String> get recentSearches => [
        'John Doe',
        'Jane Smith',
        'Mike Johnson',
        'Sarah Williams',
        'David Brown',
      ];

  static List<Contact> get contacts => [
        Contact(
          id: '1',
          username: 'johndoe',
          name: 'John Doe',
          avatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
          bio: 'Software Engineer',
          followers: 1000,
          following: 500,
          isVerified: true,
          isFollowing: true,
        ),
        Contact(
          id: '2',
          username: 'janesmith',
          name: 'Jane Smith',
          avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop&crop=face',
          bio: 'UX Designer',
          followers: 500,
          following: 300,
          isVerified: false,
          isFollowing: false,
        ),
        Contact(
          id: '3',
          username: 'mikejohnson',
          name: 'Mike Johnson',
          avatar: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150&h=150&fit=crop&crop=face',
          bio: 'Photographer',
          followers: 2000,
          following: 1000,
          isVerified: true,
          isFollowing: true,
        ),
        Contact(
          id: '4',
          username: 'sarahwilliams',
          name: 'Sarah Williams',
          avatar: 'https://images.unsplash.com/photo-1580489944761-15a19d654956?w=150&h=150&fit=crop&crop=face',
          bio: 'Travel Blogger',
          followers: 300,
          following: 200,
          isVerified: false,
          isFollowing: false,
        ),
        Contact(
          id: '5',
          username: 'davidbrown',
          name: 'David Brown',
          avatar: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150&h=150&fit=crop&crop=face',
          bio: 'Fitness Trainer',
          followers: 1500,
          following: 800,
          isVerified: true,
          isFollowing: true,
        ),
      ];

  static List<Post> get posts => [
        Post(
          id: '1',
          userId: '1',
          username: 'johndoe',
          userAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
          caption: 'Beautiful sunset!',
          imageUrls: ['https://images.unsplash.com/photo-1506744038136-46273834b3fb?w=500&h=500&fit=crop'],
          likes: 100,
          comments: [
            Comment(
              id: '1',
              userId: '2',
              username: 'janesmith',
              text: 'Amazing view!',
              createdAt: DateTime.now().subtract(const Duration(hours: 1)),
            ),
          ],
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        Post(
          id: '2',
          userId: '2',
          username: 'janesmith',
          userAvatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150&h=150&fit=crop&crop=face',
          caption: 'My cat is so cute!',
          imageUrls: ['https://images.unsplash.com/photo-1518791841217-8f162f1e1131?w=500&h=500&fit=crop'],
          likes: 50,
          comments: [
            Comment(
              id: '2',
              userId: '1',
              username: 'johndoe',
              text: 'Adorable!',
              createdAt: DateTime.now().subtract(const Duration(hours: 2)),
            ),
          ],
          createdAt: DateTime.now().subtract(const Duration(hours: 5)),
        ),
        Post(
          id: '3',
          userId: '3',
          username: 'mikejohnson',
          userAvatar: 'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?w=150&h=150&fit=crop&crop=face',
          caption: 'New puppy!',
          imageUrls: ['https://images.unsplash.com/photo-1529778873920-4da4926a72c2?w=500&h=500&fit=crop'],
          likes: 200,
          comments: [
            Comment(
              id: '3',
              userId: '1',
              username: 'johndoe',
              text: 'Congratulations!',
              createdAt: DateTime.now().subtract(const Duration(hours: 3)),
            ),
          ],
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
        ),
      ];

  static List<Post> getPosts() {
    return [
      Post(
        id: '4',
        userId: '4',
        username: 'user1',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Loving this view! #nature #travel',
        imageUrls: ['https://picsum.photos/id/1/500/500'],
        likes: 123,
        comments: [
          Comment(
            id: '4',
            userId: '5',
            username: 'traveler_jane',
            text: 'Stunning!',
            createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Post(
        id: '5',
        userId: '5',
        username: 'traveler_jane',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Adventure awaits! 🌄 #hiking #mountains',
        imageUrls: ['https://picsum.photos/id/10/500/500'],
        likes: 287,
        comments: [
          Comment(
            id: '5',
            userId: '4',
            username: 'user1',
            text: 'Have fun!',
            createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      ),
      Post(
        id: '6',
        userId: '6',
        username: 'foodie_mike',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Best brunch ever! 🍳 #foodporn #weekend',
        imageUrls: ['https://picsum.photos/id/20/500/500'],
        likes: 432,
        comments: [
          Comment(
            id: '6',
            userId: '7',
            username: 'fitness_guru',
            text: 'Looks delicious!',
            createdAt: DateTime.now().subtract(const Duration(hours: 3)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 7)),
      ),
      Post(
        id: '7',
        userId: '7',
        username: 'fitness_guru',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'No pain, no gain! 💪 #workout #fitness',
        imageUrls: ['https://picsum.photos/id/30/500/500'],
        likes: 654,
        comments: [
          Comment(
            id: '7',
            userId: '6',
            username: 'foodie_mike',
            text: 'Keep it up!',
            createdAt: DateTime.now().subtract(const Duration(hours: 4)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 9)),
      ),
      Post(
        id: '8',
        userId: '8',
        username: 'art_lover',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Found this amazing street art today! 🎨 #art #urban',
        imageUrls: ['https://picsum.photos/id/40/500/500'],
        likes: 321,
        comments: [
          Comment(
            id: '8',
            userId: '9',
            username: 'pet_paradise',
            text: 'Incredible!',
            createdAt: DateTime.now().subtract(const Duration(hours: 5)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 12)),
      ),
      Post(
        id: '9',
        userId: '9',
        username: 'pet_paradise',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Meet my new furry friend! 🐶 #pets #dogs',
        imageUrls: ['https://picsum.photos/id/50/500/500'],
        likes: 876,
        comments: [
          Comment(
            id: '9',
            userId: '8',
            username: 'art_lover',
            text: 'So cute!',
            createdAt: DateTime.now().subtract(const Duration(hours: 6)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 15)),
      ),
      Post(
        id: '10',
        userId: '10',
        username: 'tech_geek',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Just got the latest gadget! 📱 #tech #innovation',
        imageUrls: ['https://picsum.photos/id/60/500/500'],
        likes: 543,
        comments: [
          Comment(
            id: '10',
            userId: '11',
            username: 'fashion_forward',
            text: 'Nice!',
            createdAt: DateTime.now().subtract(const Duration(hours: 7)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 18)),
      ),
      Post(
        id: '11',
        userId: '11',
        username: 'fashion_forward',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'OOTD for the weekend! 👗 #fashion #style',
        imageUrls: ['https://picsum.photos/id/70/500/500'],
        likes: 765,
        comments: [
          Comment(
            id: '11',
            userId: '10',
            username: 'tech_geek',
            text: 'Looking great!',
            createdAt: DateTime.now().subtract(const Duration(hours: 8)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 21)),
      ),
      Post(
        id: '12',
        userId: '12',
        username: 'bookworm',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Current read. Can\'t put it down! 📚 #books #reading',
        imageUrls: ['https://picsum.photos/id/80/500/500'],
        likes: 234,
        comments: [
          Comment(
            id: '12',
            userId: '13',
            username: 'sunset_chaser',
            text: 'What\'s the title?',
            createdAt: DateTime.now().subtract(const Duration(hours: 9)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 24)),
      ),
      Post(
        id: '13',
        userId: '13',
        username: 'sunset_chaser',
        userAvatar: 'assets/profile_placeholder.jpg',
        caption: 'Golden hour magic ✨ #sunset #photography',
        imageUrls: ['https://picsum.photos/id/90/500/500'],
        likes: 987,
        comments: [
          Comment(
            id: '13',
            userId: '12',
            username: 'bookworm',
            text: 'Breathtaking!',
            createdAt: DateTime.now().subtract(const Duration(hours: 10)),
          ),
        ],
        createdAt: DateTime.now().subtract(const Duration(hours: 27)),
      ),
    ];
  }
}