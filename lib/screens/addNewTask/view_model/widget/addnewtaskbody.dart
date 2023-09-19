
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/Home_screen.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';

import '../../../../../core/component/component.dart';
import '../../../../core/cache_helper.dart';
import '../../../update_user_details/views/cubit/cubit.dart';
import '../../view/cubit/cubit.dart';
import '../../view/cubit/states.dart';


class AddNewTaskBody  extends StatelessWidget {
  AddNewTaskBody ({Key? key}) : super(key: key);


  bool isvisible = false;
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var assignEmployeeController = TextEditingController();
  var assignDepartmentController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<CubitAddNewTask, AddNewTaskStates>(
      listener: (context, state) {


      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text('Add New Task!', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.h),
                    Text(
                      'Create a new task now and assign it to employees right away.',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),

                    openDatePicker(),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller:titleController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your title';
                        }
                        return null;
                      },
                      label: 'title',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: descriptionController,
                      type: TextInputType.visiblePassword,
                      maxline: 4,

                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Description';
                        }
                        return null;
                      },
                      label: 'Description',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: assignEmployeeController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please Assign Employee';
                        }
                        return null;
                      },
                      label: 'Assign Employee',
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () {

                        if (formKey.currentState!.validate()) {
                          isvisible = true;
                          CubitAddNewTask.get(context).addNewTask(name:titleController.text,
                              description: descriptionController.text, );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#5A55CA'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: const Size(312, 48),
                      ),
                      child: Text(
                        'CREATE',
                        style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
DateTime setDate = DateTime.now();

Widget openDatePicker() {
  DateTime setDate = DateTime.now();
  return Center(
    child: Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orangeAccent, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: CalendarDatePicker(
        initialDate: setDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 100000)),
        onDateChanged: (DateTime value) {},
      ),
    ),
  );
}