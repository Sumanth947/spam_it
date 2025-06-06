import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  final Post post;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;

  const PostCard({
    Key? key,
    required this.post,
    this.onLike,
    this.onComment,
    this.onShare,
  }) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Post Header
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(widget.post.userAvatar),
            ),
            title: Text(
              widget.post.username,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(_getTimeAgo(widget.post.createdAt)),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // Show more options
              },
            ),
          ),
          // Post Image
          if (widget.post.imageUrls.isNotEmpty)
            Container(
              height: 300,
              width: double.infinity,
              child: PageView.builder(
                itemCount: widget.post.imageUrls.length,
                itemBuilder: (context, index) {
                  return Image.network(
                    widget.post.imageUrls[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          // Post Actions
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    widget.onLike?.call();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.comment_outlined),
                  onPressed: widget.onComment,
                ),
                IconButton(
                  icon: Icon(Icons.share_outlined),
                  onPressed: widget.onShare,
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.bookmark_border),
                  onPressed: () {
                    // Save post
                  },
                ),
              ],
            ),
          ),
          // Likes Count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${widget.post.likes} likes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          // Post Caption
          if (widget.post.caption.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: [
                    TextSpan(
                      text: widget.post.username,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: ' ${widget.post.caption}'),
                  ],
                ),
              ),
            ),
          // Comments
          if (widget.post.comments.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: widget.onComment,
                child: Text(
                  'View all ${widget.post.comments.length} comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          SizedBox(height: 8),
        ],
      ),
    );
  }

  String _getTimeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    } else {
      return 'now';
    }
  }
}