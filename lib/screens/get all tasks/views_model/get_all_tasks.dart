import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../core/cache_helper.dart';
import '../../update_task/task_screen.dart';
import '../views/cubit/cubit.dart';
import '../views/cubit/states.dart';

class GetAllTasksView extends StatelessWidget {
  const GetAllTasksView({Key? key}) : super(key: key);

  // Define your custom color palette
  final Color primaryColor = Colors.purple;
  final Color accentColor = Colors.purpleAccent;
  final Color cardColor = Colors.white;
  final Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
        backgroundColor: HexColor('#5A55CA'), // Use the primary color for the app bar
      ),
      body: BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetAllTasksCubit>(context);
          if (state is GetAllTasksSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) =>
                  Padding(

                padding: const EdgeInsets.only(bottom: 10),
                child: Card(

                  elevation: 2.0,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: cardColor, // Use the cardColor for the card
                  child: ListTile(
                    leading: const Icon(
                      Icons.task,
                      color: Colors.grey, // Use the accent color for icons
                    ),
                    title: Text(
                      '${cubit.tasks[index].creatorModel.user_type} ${cubit.tasks[index].creatorModel.name} ${cubit.tasks[index].employeeModel.email == CacheHelper.getData(key: 'email') ? 'gave to you' :'gave ${cubit.tasks[index].employeeModel.name}'}\nTask name: ${cubit.tasks[index].taskName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: textColor, // Use the textColor for text
                      ),
                    ),
                    subtitle: Text(
                      'Start date: ${cubit.tasks[index].startDate}\nEnd date: ${cubit.tasks[index].endDate}',
                      style: TextStyle(color: textColor), // Use the textColor for text
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        print('taskId:${cubit.tasks[index].id}');
                        print(' emp id :${cubit.tasks[index].employeeModel.id}');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>
                            UpdateTaskView(employeeId:cubit.tasks[index].employeeModel.id ,taskId:cubit.tasks[index].id ,)));
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,

                      ),
                      child: Text('Update Task'),
                    ),
                  ),
                ),
              ),
              itemCount: cubit.tasks.length,
              physics: const BouncingScrollPhysics(),

            );
          } else if (state is GetAllTasksLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: HexColor('#5A55CA'), // Use the accent color for the loading indicator
              ),
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/nophoto.jpeg',
                  height: 200.h,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'No tasks for you',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: textColor, // Use the textColor for text
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
