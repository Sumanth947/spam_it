import 'package:flutter/material.dart';
import '../models/group_model.dart';
import 'add_contacts_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _searchController = TextEditingController();
  List<Group> _searchResults = [];
  List<Group> _recentGroups = [
    Group(
      id: '1',
      name: 'Flutter Developers',
      description: 'A group for Flutter enthusiasts',
      coverImage: 'https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=300&h=200&fit=crop',
      memberIds: ['1', '2', '3', '4', '5'],
      adminId: '1',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      category: 'Technology',
    ),
    Group(
      id: '2',
      name: 'Photography Club',
      description: 'Share your best shots',
      coverImage: 'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=300&h=200&fit=crop',
      memberIds: ['2', '3', '4'],
      adminId: '2',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      category: 'Art',
    ),
    Group(
      id: '3',
      name: 'Book Club',
      description: 'Monthly book discussions',
      coverImage: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=200&fit=crop',
      memberIds: ['1', '3', '5', '6'],
      adminId: '3',
      createdAt: DateTime.now().subtract(Duration(days: 7)),
      category: 'Literature',
    ),
  ];
  
  List<Group> _allGroups = [
    Group(
      id: '1',
      name: 'Flutter Developers',
      description: 'A group for Flutter enthusiasts',
      coverImage: 'https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=300&h=200&fit=crop',
      memberIds: ['1', '2', '3', '4', '5'],
      adminId: '1',
      createdAt: DateTime.now().subtract(Duration(days: 2)),
      category: 'Technology',
    ),
    Group(
      id: '2',
      name: 'Photography Club',
      description: 'Share your best shots',
      coverImage: 'https://images.unsplash.com/photo-1452587925148-ce544e77e70d?w=300&h=200&fit=crop',
      memberIds: ['2', '3', '4'],
      adminId: '2',
      createdAt: DateTime.now().subtract(Duration(days: 5)),
      category: 'Art',
    ),
    Group(
      id: '3',
      name: 'Book Club',
      description: 'Monthly book discussions',
      coverImage: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=200&fit=crop',
      memberIds: ['1', '3', '5', '6'],
      adminId: '3',
      createdAt: DateTime.now().subtract(Duration(days: 7)),
      category: 'Literature',
    ),
    Group(
      id: '4',
      name: 'Fitness Enthusiasts',
      description: 'Get fit together',
      coverImage: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=300&h=200&fit=crop',
      memberIds: ['4', '5', '6', '7'],
      adminId: '4',
      createdAt: DateTime.now().subtract(Duration(days: 10)),
      category: 'Health',
    ),
    Group(
      id: '5',
      name: 'Music Lovers',
      description: 'Share and discover music',
      coverImage: 'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?w=300&h=200&fit=crop',
      memberIds: ['1', '2', '5', '8'],
      adminId: '5',
      createdAt: DateTime.now().subtract(Duration(days: 12)),
      category: 'Music',
    ),
  ];
  
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    if (_searchController.text.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchResults = [];
      });
    } else {
      setState(() {
        _isSearching = true;
        _searchResults = _allGroups
            .where((group) =>
                group.name
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()) ||
                group.description
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()) ||
                group.category
                    .toLowerCase()
                    .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Groups'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Search Bar with Add Button
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search groups...',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddContactsPage(),
                      ),
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          
          // Content
          Expanded(
            child: _isSearching ? _buildSearchResults() : _buildDefaultContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultContent() {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: _allGroups.length,
      itemBuilder: (context, index) {
        final group = _allGroups[index];
        return _buildGroupCard(group);
      },
    );
  }

  Widget _buildGroupCard(Group group) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Group Image
          Stack(
            children: [
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(group.coverImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 6,
                right: 6,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    group.category,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Group Info
          Padding(
            padding: EdgeInsets.all(6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  group.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2),
                Text(
                  group.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 10,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      Icons.people,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 2),
                    Text(
                      '${group.memberCount} members',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 12,
                      color: Colors.grey[600],
                    ),
                    SizedBox(width: 2),
                    Text(
                      '3 mutual friends', // You can replace this with actual mutual friends count
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No groups found',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Try searching with different keywords',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        final group = _searchResults[index];
        return _buildGroupTile(group);
      },
    );
  }

  Widget _buildGroupTile(Group group) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group Image
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(group.coverImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12),
            // Group Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    group.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    group.description,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      SizedBox(width: 4),
                      Text(
                        '${group.memberCount} members',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            group.category,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Join Button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Joined ${group.name}'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Join',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}