import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  TextEditingController _captionController = TextEditingController();
  List<String> _selectedImages = [];

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
        elevation: 0,
        actions: [
          TextButton(
            onPressed: _selectedImages.isEmpty ? null : _sharePost,
            child: Text(
              'Share',
              style: TextStyle(
                color: _selectedImages.isEmpty ? Colors.grey : Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Image Selection
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: _selectedImages.isEmpty
                ? _buildImageSelector()
                : _buildSelectedImages(),
          ),
          // Caption Input
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=150&h=150&fit=crop&crop=face',
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TextField(
                    controller: _captionController,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: 'Write a caption...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          // Post Options
          _buildPostOptions(),
        ],
      ),
    );
  }

  Widget _buildImageSelector() {
    return InkWell(
      onTap: _selectImages,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.camera_alt_outlined,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Tap to select photos',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectedImages() {
    return PageView.builder(
      itemCount: _selectedImages.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.network(
                _selectedImages[index],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedImages.removeAt(index);
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPostOptions() {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text('Add location'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Add location functionality
          },
        ),
        ListTile(
          leading: Icon(Icons.person_add_outlined),
          title: Text('Tag people'),
          trailing: Icon(Icons.chevron_right),
          onTap: () {
            // Tag people functionality
          },
        ),
        ListTile(
          leading: Icon(Icons.facebook),
          title: Text('Share to Facebook'),
          trailing: Switch(
            value: false,
            onChanged: (value) {
              // Toggle Facebook sharing
            },
          ),
        ),
        ListTile(
          leading: Icon(Icons.alternate_email),
          title: Text('Share to Twitter'),
          trailing: Switch(
            value: false,
            onChanged: (value) {
              // Toggle Twitter sharing
            },
          ),
        ),
      ],
    );
  }

  void _selectImages() {
    // Simulate image selection
    setState(() {
      _selectedImages = [
        'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=400&fit=crop',
      ];
    });
  }

  void _sharePost() {
    if (_selectedImages.isEmpty) return;

    // Simulate sharing post
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Post shared successfully!'),
        backgroundColor: Colors.green,
      ),
    );

    // Navigate back
    Navigator.pop(context);
  }
}