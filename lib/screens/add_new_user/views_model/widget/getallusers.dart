import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app_errasoft/screens/addNewTask/view_model/widget/addnewtaskbody.dart';

import '../../../addNewTask/view_model/addnewtask.dart';
import '../../../update_user_details/views_model/update_user_details.dart';
import '../../../update_user_details/views_model/widget/update_user_details_body.dart';
import '../../views/cubit/cubit.dart';
import '../../views/cubit/state.dart';

class GetAllUsersView extends StatelessWidget {
  const GetAllUsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users'),
      ),
      body: BlocConsumer<CubitNewUser, AddNewUserStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: ListView.builder(
              itemCount: CubitNewUser.get(context).users.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final user = CubitNewUser.get(context).users[index];
                return Card(
                  elevation: 3.0,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ListTile(
                    onTap: () {},
                    tileColor: Colors.grey[200],
                    title: Text(
                      'Name: ${user.name}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: CircleAvatar(
                      child: Icon(Icons.person),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email: ${user.email}',
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'User Type: ${user.userType}', // Use correct property name
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UpdateUserDetailsBody(id: user.id),
                                  ),
                                );
                              },
                              child: Text('Update User'),
                            ),
                            SizedBox(width: 10.w),
                            ElevatedButton(
                              onPressed: () {

                              },
                              child: Text('Delete User'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
