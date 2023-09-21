import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks_app_errasoft/screens/update_task/states_task.dart';

import '../addNewTask/view_model/widget/addnewtaskbody.dart';
import '../get all tasks/views/cubit/cubit.dart';
import 'cubit_task.dart';
import 'modeltask.dart';

class UpdateTaskView extends StatelessWidget {
  UpdateTaskView({Key? key, required this.taskId,required this.employeeId }) : super(key: key);
  final formKey=GlobalKey<FormState>();
  final String taskId;
  final String employeeId;

  dynamic today = DateUtils.dateOnly(DateTime.now());
  List<DateTime?>dateNow=[
  ];
  String ?x,y;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
          child: SingleChildScrollView(
              child:
              Form(
                  key: formKey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Update Task!',
                      style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)),

                        SizedBox(
                          height: 20.h,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          'Update task to specific user  ',
                          style: GoogleFonts.roboto(
                            fontSize: 16.sp,
                            color: HexColor('#7C808A'),
                          ),

                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(width: 312.w,height: 280.h,decoration: BoxDecoration(border: Border.all(color:const Color(0xff091E4A) ),
                          borderRadius: BorderRadius.circular(1),),
                          child: CalendarDatePicker2(
                              config: CalendarDatePicker2Config(centerAlignModePicker: true,

                                  calendarType: CalendarDatePicker2Type.range,
                                  selectedDayHighlightColor:Colors.purple
                              ),
                              value: dateNow,
                              onValueChanged: (dates) {
                                dateNow.clear();
                                dateNow = dates;
                                if (dateNow.isNotEmpty && dateNow.length == 2) {
                                  x = dateNow[0].toString().substring(0, 11);
                                  print(x);
                                  y = dateNow[1].toString().substring(0, 11);
                                  print(y);
                                }

                              }

                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                          controller: titleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter the title';
                            }
                          },
                          hintText: 'Title',
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        CustomTextFormField(
                            maxLines: 5,
                            hintText: 'Description',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your description';
                              } else {
                                // if (!cubit.regex.hasMatch(value))
                                // {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(
                                //           content: Text(
                                //               'password must contain capital letter and special characters')));
                                //   return 'please enter valid password';
                                // }
                              }
                            },
                            inputType: TextInputType.visiblePassword,
                            controller: descriptionController),
                        SizedBox(
                          height: 20.h,
                        ),

                        SizedBox(
                          width: 312.w,
                          height: 48.h,
                          child: BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
                            builder: (context, state) {
                              var cubit=BlocProvider.of<UpdateTaskCubit>(context);
                              return ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        cubit.updateTask(UpdateTaskModel(id: taskId,
                                            description: descriptionController.text,
                                            taskName: titleController.text, status: '0',
                                            startDate: x!,
                                            endDate: y!),employeeId);
                                        BlocProvider.of<GetAllTasksCubit>(context).getAllTasks();
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                                content:
                                                Text('updated successfully')));
                                      } catch (error) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                            const SnackBar(
                                                content:
                                                Text('there is an error')));
                                      }

                                      // ScaffoldMessenger.of(context).showSnackBar(
                                      //     const SnackBar(
                                      //         content: Text('Login Successfully')));

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
                              'Update',
                              style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                              ));
                            },
                          ),
                        )
                      ]))

          )),
    );
  }
}