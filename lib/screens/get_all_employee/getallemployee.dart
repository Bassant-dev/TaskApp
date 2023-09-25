import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../get all tasks/views/cubit/cubit.dart';
import '../update_task/modeltask.dart';
import '../update_task/task_screen.dart';
import 'cubitemplyee.dart';
import 'statesemployee.dart';


class GetAllEmployee extends StatelessWidget {
  const GetAllEmployee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Employees'),
      ),
      body: BlocConsumer<GetAllEmployeesCubit, GetAllEmployeesState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: ListView.builder(
              itemCount: GetAllEmployeesCubit.get(context).employees.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final user = GetAllEmployeesCubit.get(context).employees[index];
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
                                    UpdateTaskView(employeeId:' ${user.id}' ,taskId:GetAllTasksCubit.get(context).tasks[index].id),
                                  ),
                                );
                              },
                              child: Text('Update Task'),
                            ),
                            SizedBox(width: 10.w),

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
