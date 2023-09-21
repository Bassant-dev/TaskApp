import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasks_app_errasoft/screens/getemployee/states.dart';

import '../Home_Screen/drawer2.dart';
import 'cubit.dart';

class GetEmployessDepartment extends StatelessWidget {
  GetEmployessDepartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: CustomDrawer2(userName: 'Manager',),
      appBar: AppBar(), body:
    BlocBuilder<GetEmployeesDepartmentCubit, GetEmployeesDepartmentState>(
      builder: (context, state) {
       // var cubit=BlocProvider.of<GetEmployeesDepartmentCubit>(context);
        return
          ListView.builder(
            itemCount: GetEmployeesDepartmentCubit.get(context).employeesDepartment.length,
            itemBuilder: (context, index) {
              final employee = GetEmployeesDepartmentCubit.get(context).employeesDepartment[index];
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  elevation: 2.0, // Add elevation to the card
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text(
                      employee.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      employee.email,
                      style: TextStyle(color: Colors.grey),
                    ),

                  ),
                ),
              );
            },
          );

      },
    ),);
  }
}

