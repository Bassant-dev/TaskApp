import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/screen_tasks.dart';

import '../../core/cache_helper.dart';

import 'drawer.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "token"));
    return Scaffold(
      drawer: CustomDrawer(),
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

        title: Row(
          children: [
             Column(
              children: [
                Text('Today',style: TextStyle(fontSize: 16.sp),),
                SizedBox(height: 2,),
                Text('11/9/2023',style: TextStyle(fontSize: 12.sp,color: Colors.grey),),
              ],
            ),
            SizedBox(width: 100),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    print('Employee tapped');
                  },
                  child: Text(
                    'Employee',
                    style: TextStyle(fontSize: 10.0.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap for 'department'
                    print('Department tapped');
                  },
                  child: Text(
                    'Department',
                    style: TextStyle(fontSize: 10.0.sp),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Handle the tap for 'task'
                    print('Task tapped');
                  },
                  child: Text(
                    'Task',
                    style: TextStyle(fontSize: 10.0.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    print('Button 1 pressed');
                  },
                  icon: Icon(Icons.person, color: Colors.black),
                  label: Text(
                    'USERS',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 14.sp,),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenTask(), // Replace 'Home_screen' with the actual screen you want to navigate to
                      ),
                    );
                  },
                  icon: Icon(Icons.task, color: Colors.black),
                  label: Text(
                    'TASKS',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('department name'),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for the GridView
            padding: EdgeInsets.all(10),
            itemCount: 4,
            itemBuilder: (context, index) {
              return EmployeeCard(
                title: 'ADMIN',
                userEmail: 'admin@example.com',
                userPassword: 'admin123',
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('department name'),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: 4,
            itemBuilder: (context, index) {
              return EmployeeCard(
                title: 'ADMIN',
                userEmail: 'admin@example.com',
                userPassword: 'admin123',
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('department name'),
          ),
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.all(10),
            itemCount: 4,
            itemBuilder: (context, index) {
              return EmployeeCard(
                title: 'ADMIN',
                userEmail: 'admin@example.com',
                userPassword: 'admin123',
              );
            },
          ),
        ],
      ),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Employee name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(title!,style: TextStyle(color: Colors.grey),),
            ),
            ListTile(
              title: Text(
                'user name',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            ListTile(
              title: Text(
                'user name',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
