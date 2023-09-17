import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../add_new_user/views_model/add_new_user.dart';
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
          title: const Text('Update User Details!'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  UpdateUserDetailsBody(), // Replace 'Home_screen' with the actual screen you want to navigate to
              ),
            );


          },

        ),
        ListTile(
          title: const Text('Logout'),
          onTap: () {

          },

        ),
      ],
    );
  }
}
