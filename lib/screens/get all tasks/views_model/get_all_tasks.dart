import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/cache_helper.dart';
import '../views/cubit/cubit.dart';
import '../views/cubit/states.dart';


class GetAllTasksView extends StatelessWidget {
  const GetAllTasksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<GetAllTasksCubit, GetAllTasksState>(
        builder: (context, state) {
          var cubit = BlocProvider.of<GetAllTasksCubit>(context);
          if (state is GetAllTasksSuccess) {
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Card(
                  color:Colors.purpleAccent,
                  child: ListTile(
                    leading: const Icon(
                      Icons.task,
                    ),
                    title: Text(
                      '${cubit.tasks[index].creatorModel.user_type} ${cubit.tasks[index].creatorModel.name} ${cubit.tasks[index].employeeModel.email == CacheHelper.getData(key: 'email') ? 'give to you' :'gives ${cubit.tasks[index].employeeModel.name}'}\n task name : ${cubit.tasks[index].taskName}',
                    ),
                    subtitle: Text(
                      ' start date:${cubit.tasks[index].startDate}\n end date:${cubit.tasks[index].endDate}',
                    ),
                  ),
                ),
              ),
              itemCount: cubit.tasks.length,
              physics: const BouncingScrollPhysics(),
            );
          } else if (state is GetAllTasksLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.purpleAccent),
            );
          } else {
            return Column(
              children: [
                Expanded(child:Image.asset('assets/img/nophoto.jpeg')
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  'No Tasks for you',
                //  style: AppFont.text16,
                )
              ],
            );
          }
        },
      ),
    );
  }
}