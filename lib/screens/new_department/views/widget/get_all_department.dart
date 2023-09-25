import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app_errasoft/screens/addNewTask/view_model/widget/addnewtaskbody.dart';

import '../../../Home_Screen/drawer.dart';
import '../../../addNewTask/view_model/addnewtask.dart';
import '../../../update_department/view_model/cubit/cubit.dart';
import '../../../update_department/view_model/cubit/state.dart';
import '../../../update_department/views/widget/update_dep_screen_body.dart';
import '../../../update_user_details/views_model/update_user_details.dart';
import '../../../update_user_details/views_model/widget/update_user_details_body.dart';
import '../../view_model/cubit/cubit.dart';
import '../../view_model/cubit/states.dart';

class GetAllDepView extends StatelessWidget {
  const GetAllDepView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(userName: 'Admin',),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Department'),
      ),

      body: BlocConsumer<CubitDep, DepStates>(
        listener: (context, state) {


        },
        builder: (context, state) {

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: ListView.builder(
                itemCount: CubitDep.get(context).users.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  final user = CubitDep.get(context).users[index];
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
                                          UpdateUserDepBody(id: user.id),
                                    ),
                                  );
                                  //GetAllDepView();
                                },
                                child: Text('Update Dep'),
                              ),
                              SizedBox(width: 10.w),
                              ElevatedButton(
                                onPressed: () {
                                  CubitUpdateDep.get(context).deleteDepartment(user.id,context);

                                },
                                child: Text('Delete Dep'),
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
