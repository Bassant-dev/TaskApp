import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks_app_errasoft/screens/addNewTask/view_model/widget/addnewtaskbody.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/login_screen/views/login_screen.dart';
import '../get_all_employee/getallemployee.dart';
import '../add_new_user/views_model/add_new_user.dart';
import '../add_new_user/views_model/widget/getallusers.dart';
import '../get all tasks/views_model/get_all_tasks.dart';
import '../login_screen/view_model/cubit/states.dart';
import '../new_department/views/new_department.dart';
import '../new_department/views/widget/get_all_department.dart';


class CustomDrawer2 extends StatelessWidget {
  final String userName;

  const CustomDrawer2({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: DrawerBody(userName: userName),
    );
  }
}

class DrawerBody extends StatelessWidget {
  final String userName;

  const DrawerBody({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<CubitTask, TaskStates>(
      listener: (context, state) {
        if (state is LogoutSuccessful) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
      },
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
              ),
              accountEmail: Text(
                userName,
              ),
              currentAccountPicture: Icon(
                Icons.person,
                size: 80,
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                color: HexColor('#5A55CA'),
              ),
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Add New Task'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewTaskView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Get ALL Task'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetAllTasksView(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Get ALL Employees'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetAllEmployee(),
                  ),
                );
              },
            ),
            Divider(), // Add a divider line
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                CubitTask.get(context).logout();
              },
            ),
          ],
        );
      },
    );
  }
}
