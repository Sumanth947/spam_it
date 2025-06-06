import 'package:flutter/material.dart';
import '../models/mock_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String? selectedYear;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userData = MockData.profileData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          userData['username'],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, size: 24),
            onPressed: () {
              // TODO: Navigate to create memory/post
            },
          ),
          IconButton(
            icon: const Icon(Icons.menu, size: 24),
            onPressed: () {
              // TODO: Open menu
            },
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.grey.shade200, width: 1),
                            image: DecorationImage(
                              image: NetworkImage(MockData.contacts[0].avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStat(userData['memories'], 'Memories'),
                              _buildStat(userData['groups'], 'Groups'),
                              _buildStat(userData['years'].length, 'Years'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userData['fullName'],
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userData['bio'],
                          style: const TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // TODO: Edit profile
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey), // Fixed BorderSide
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 90,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MockData.storyHighlights.length,
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey.shade200, width: 1),
                                ),
                                child: const Icon(Icons.add, size: 28, color: Colors.black),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                MockData.storyHighlights[index],
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Memories'),
                    Tab(text: 'Timeline'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: userData['posts'].length,
              itemBuilder: (context, index) {
                return Image.network(
                  userData['posts'][index]['image'],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                );
              },
            ),
            selectedYear == null
                ? ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: userData['years'].length,
                    itemBuilder: (context, index) {
                      final year = userData['years'][index];
                      return ListTile(
                        title: Text(
                          year.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          setState(() {
                            selectedYear = year.toString();
                          });
                        },
                      );
                    },
                  )
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedYear = null;
                              });
                            },
                            child: const Text(
                              'Back to Timeline',
                              style: TextStyle(fontSize: 14, color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: userData['posts']
                              .where((post) => post['year'] == selectedYear)
                              .length,
                          itemBuilder: (context, index) {
                            final posts = userData['posts']
                                .where((post) => post['year'] == selectedYear)
                                .toList();
                            return Image.network(
                              posts[index]['image'],
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.error, color: Colors.red),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildStat(int count, String label) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return false;
  }
}