import 'package:flutter/material.dart';
import '../models/contact_model.dart';

class AddContactsPage extends StatefulWidget {
  const AddContactsPage({Key? key}) : super(key: key);

  @override
  State<AddContactsPage> createState() => _AddContactsPageState();
}

class _AddContactsPageState extends State<AddContactsPage> {
  bool _permissionGranted = false;
  final Map<String, bool> _selectedContacts = {};

  // Sample contacts data
  final List<Contact> _contacts = [
    Contact(
      id: '1',
      name: "John Doe",
      username: "johndoe",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Software Engineer",
      followers: 1000,
      following: 500,
    ),
    Contact(
      id: '2',
      name: "Jane Smith",
      username: "janesmith",
      avatar: "assets/profile_placeholder.jpg",
      bio: "UX Designer",
      followers: 500,
      following: 300,
    ),
    Contact(
      id: '3',
      name: "Robert Johnson",
      username: "robertj",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Photographer",
      followers: 2000,
      following: 1000,
    ),
    Contact(
      id: '4',
      name: "Emily Davis",
      username: "emilyd",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Marketing Specialist",
      followers: 800,
      following: 400,
    ),
    Contact(
      id: '5',
      name: "Michael Wilson",
      username: "mikew",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Graphic Designer",
      followers: 1200,
      following: 600,
    ),
    Contact(
      id: '6',
      name: "Sarah Brown",
      username: "sarahb",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Content Creator",
      followers: 1500,
      following: 750,
    ),
    Contact(
      id: '7',
      name: "David Miller",
      username: "davidm",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Software Developer",
      followers: 900,
      following: 450,
    ),
    Contact(
      id: '8',
      name: "Jennifer Taylor",
      username: "jennifert",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Digital Artist",
      followers: 1100,
      following: 550,
    ),
    Contact(
      id: '9',
      name: "James Anderson",
      username: "jamesa",
      avatar: "assets/profile_placeholder.jpg",
      bio: "UI/UX Designer",
      followers: 1300,
      following: 650,
    ),
    Contact(
      id: '10',
      name: "Lisa Thomas",
      username: "lisat",
      avatar: "assets/profile_placeholder.jpg",
      bio: "Social Media Manager",
      followers: 950,
      following: 475,
    ),
  ];

  void _toggleContact(String id) {
    setState(() {
      _selectedContacts[id] = !(_selectedContacts[id] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Contacts'),
        elevation: 0,
      ),
      body: _permissionGranted ? _buildContactsList() : _buildPermissionRequest(),
      bottomNavigationBar: _permissionGranted ? _buildBottomBar() : null,
    );
  }

  Widget _buildPermissionRequest() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.contacts,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 24),
            const Text(
              'Allow access to contacts',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            const Text(
              'SpamIt needs access to your contacts to help you connect with friends and family.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _permissionGranted = true;
                });
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Allow Access',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Navigate to create group page instead of just popping
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateGroupPage(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactsList() {
    return ListView.builder(
      itemCount: _contacts.length,
      itemBuilder: (context, index) {
        final contact = _contacts[index];
        final isSelected = _selectedContacts[contact.id] ?? false;
        
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(contact.avatar),
            child: Text(contact.name[0]),
          ),
          title: Text(contact.name),
          subtitle: Text('@${contact.username}'),
          trailing: Checkbox(
            value: isSelected,
            onChanged: (value) {
              _toggleContact(contact.id);
            },
          ),
          onTap: () {
            _toggleContact(contact.id);
          },
        );
      },
    );
  }

  Widget _buildBottomBar() {
    final selectedCount = _selectedContacts.values.where((selected) => selected).length;
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                // Use pushAndRemoveUntil to clear the navigation stack
                // This ensures when we go back to home, it's a fresh instance
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const CreateGroupPage(),
                  ),
                  (route) => false, // Remove all previous routes
                );
              },
              child: const Text('Skip'),
            ),
            ElevatedButton(
              onPressed: selectedCount > 0
                  ? () {
                      // In a real app, you would save the selected contacts
                      Navigator.of(context).pop();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added $selectedCount contacts'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  : null,
              child: Text('Add Selected ($selectedCount)'),
            ),
          ],
        ),
      ),
    );
  }
}

// New class for creating a group
class CreateGroupPage extends StatefulWidget {
  const CreateGroupPage({Key? key}) : super(key: key);

  @override
  State<CreateGroupPage> createState() => _CreateGroupPageState();
}

class _CreateGroupPageState extends State<CreateGroupPage> {
  final TextEditingController _groupNameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _groupNameController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _groupNameController.text.trim().isNotEmpty;
    });
  }

  @override
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Create a New Group',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _groupNameController,
              decoration: InputDecoration(
                labelText: 'Group Name',
                hintText: 'Enter a name for your group',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.group),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _isButtonEnabled
                  ? () {
                      final groupName = _groupNameController.text.trim();
                      
                      // Use pushNamedAndRemoveUntil to clear the stack and go to home
                      // This ensures the bottom navigation is reset properly
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        '/', // Main route
                        (route) => false, // Remove all previous routes
                      );
                      
                      // Show confirmation
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Group "$groupName" created successfully'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}