import 'package:flutter/material.dart';
import '../utils/mock_data.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<Map<String, dynamic>> notifications = MockData.notifications;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Activity',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return _buildNotificationTile(notification);
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.notifications_none,
            size: 48,
            color: Colors.grey,
          ),
          const SizedBox(height: 12),
          const Text(
            'No notifications yet',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'When someone likes or comments on your posts,\nyou\'ll see it here.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationTile(Map<String, dynamic> notification) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: notification['isRead'] ? Colors.white : Colors.blue.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        leading: CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(notification['avatar']),
        ),
        title: RichText(
          text: TextSpan(
            style: const TextStyle(fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                text: notification['user'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' ${notification['message']}'),
            ],
          ),
        ),
        subtitle: Text(
          notification['time'],
          style: const TextStyle(fontSize: 12, color: Colors.grey),
        ),
        trailing: _buildNotificationAction(notification),
        onTap: () {
          setState(() {
            notification['isRead'] = true;
          });
          // TODO: Navigate to relevant content (e.g., group or post)
        },
      ),
    );
  }

  Widget _buildNotificationAction(Map<String, dynamic> notification) {
    switch (notification['type']) {
      case 'like':
        return const Icon(
          Icons.favorite,
          color: Colors.red,
          size: 18,
        );
      case 'comment':
        return const Icon(
          Icons.comment,
          color: Colors.grey,
          size: 18,
        );
      case 'follow':
        return ElevatedButton(
          onPressed: () {
            // TODO: Implement follow-back logic
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            minimumSize: const Size(0, 28),
            textStyle: const TextStyle(fontSize: 12),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          child: const Text('Follow'),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}