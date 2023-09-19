import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_errasoft/core/model/model_login.dart';
import 'package:tasks_app_errasoft/screens/addNewTask/view_model/widget/addnewtaskbody.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/login_screen/views/login_screen.dart';

import '../addNewTask/view_model/addnewtask.dart';
import '../add_new_user/views_model/add_new_user.dart';
import '../add_new_user/views_model/widget/getallusers.dart';
import '../login_screen/view_model/cubit/states.dart';
import '../new_department/views/new_department.dart';
import '../update_department/views/update_dep_screen.dart';
import '../update_user_details/views_model/widget/update_user_details_body.dart';

class CustomDrawer extends StatelessWidget  {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
     child: Drawer_body(),

    );
  }

}
class Drawer_body extends StatelessWidget {
  const Drawer_body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer< CubitTask,TaskStates>(
      listener: (context, state){
        if(state is LogoutSuccessful ){

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(), // Replace 'Home_screen' with the actual screen you want to navigate to
            ),
          );
        }
      },
      builder: (context, state){
        return ListView(

          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Text(''),
            ),
            ListTile(
              title: const Text('Add New Department!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewDep(), // Replace 'Home_screen' with the actual screen you want to navigate to
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Update Department!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateUserDep(), // Replace 'Home_screen' with the actual screen you want to navigate to
                  ),
                );


              },

            ),
            ListTile(
              title: const Text('Add New User!'),
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNewUser(), // Replace 'Home_screen' with the actual screen you want to navigate to
                  ),
                );
              },

            ),

            ListTile(
              title: const Text('get all users'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  GetAllUsersView(), // Replace 'Home_screen' with the actual screen you want to navigate to
                  ),
                );


              },

            ),
            ListTile(
              title: const Text('Add New Task'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AddNewTaskBody(),
                  ),
                );


              },

            ),


            ListTile(
              title: const Text('Logout'),
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
