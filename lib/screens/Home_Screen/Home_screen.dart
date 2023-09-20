import 'package:flutter/material.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/screen_tasks.dart';
import 'drawer.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userName: '',),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Column(
          children: [
            Text('Today', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('11/9/2023', style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(Icons.add, size: 28),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  onPressed: () {
                    print('Button 1 pressed');
                  },
                  icon: Icon(Icons.person, color: Colors.white),
                  label: Text('USERS', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenTask(),
                      ),
                    );
                  },
                  icon: Icon(Icons.task, color: Colors.white),
                  label: Text('TASKS', style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          _buildDepartmentSection('Department Name 1', context),
          _buildDepartmentSection('Department Name 2', context),
          _buildDepartmentSection('Department Name 3', context),
        ],
      ),
    );
  }

  Widget _buildDepartmentSection(String departmentName, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            departmentName,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16),
          itemCount: 4,
          itemBuilder: (context, index) {
            return EmployeeCard(
              title: 'ADMIN',
              userEmail: '',
              userPassword: '',
            );
          },
        ),
      ],
    );
  }
}

class EmployeeCard extends StatelessWidget {
  final String? title;
  final String? userEmail;
  final String? userPassword;

  EmployeeCard({
    this.title,
    this.userEmail,
    this.userPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Employee Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              title!,
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'User Name',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
