import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasks_app_errasoft/screens/getemployee/states.dart';

import 'cubit.dart';

class GetEmployessDepartment extends StatelessWidget {
  const GetEmployessDepartment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body:
    BlocBuilder<GetEmployeesDepartmentCubit, GetEmployeesDepartmentState>(
      builder: (context, state) {
        var cubit=BlocProvider.of<GetEmployeesDepartmentCubit>(context);
        return ListView.builder(itemBuilder:(context,index)=>Padding(
          padding:  EdgeInsets.only(bottom: 10.h),
          child: ListTile(title: Text(cubit.employeesDepartment[index].name),
            subtitle: Text(cubit.employeesDepartment[index].email),),
        ) ,itemCount: cubit.employeesDepartment.length,physics: const BouncingScrollPhysics(),

        );
      },
    ),);
  }
}

