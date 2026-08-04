import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Profile Image
            const CircleAvatar(
              radius: 55,
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.person,
                size: 65,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Victor Newton',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'victor@example.com',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            // Edit Profile
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Change your personal information',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Edit profile coming soon'),
                    ),
                  );
                },
              ),
            ),

            // My Orders
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'My Orders',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'View your previous orders',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Orders coming soon'),
                    ),
                  );
                },
              ),
            ),

            // Notifications
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Notifications',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Manage your notifications',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            // Settings
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.purple,
                  child: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'App settings and preferences',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            // Help
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Help & Support',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Get help with your account',
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ),

            const SizedBox(height: 20),

            // Logout
            SizedBox(
              width: double.infinity,
              height: 50,
              child: OutlinedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text(
                          'Are you sure you want to logout?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                const SnackBar(
                                  content: Text('Logged out'),
                                ),
                              );
                            },
                            child: const Text('Logout'),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.logout),
                label: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}