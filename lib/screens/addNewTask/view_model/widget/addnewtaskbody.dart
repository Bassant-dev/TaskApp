import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks_app_errasoft/core/model/model_login.dart';

import '../../../get_all_employee/cubitemplyee.dart';
import '../../../get_all_employee/statesemployee.dart';
import '../../view/cubit/cubit.dart';
import '../../view/cubit/states.dart';
import '../task_model.dart';


class AddNewTaskView extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController assignedEmployee = TextEditingController();
  final TextEditingController assignedDepartment = TextEditingController();
  dynamic today = DateUtils.dateOnly(DateTime.now());

  List<DateTime?>dateNow=[

  ];
  String ?x,y;

  AddNewTaskView({super.key});
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return BlocBuilder<AddNewTaskCubit, AddNewTaskState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
              child: SingleChildScrollView(
                  child:
                  Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Add New Task!',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Create a new task now and \n assign it to employees right away. ',

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
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 1,
                                  )),
                              child:

                              BlocBuilder<GetAllEmployeesCubit, GetAllEmployeesState>(
                                builder: (context, state) {
                                 // var cubit=BlocProvider.of<AddNewTaskCubit>(context);
                                //  var cubit2=BlocProvider.of<GetAllEmployeesCubit>(context);
                                  return DropdownButton<AllUserModel>(underline: const SizedBox(),


                                    value:AddNewTaskCubit.get(context).valueChoose ,
                                    isExpanded: true,
                                    hint: Padding(
                                      padding: EdgeInsets.only(left: 16.w),
                                      child: const Text('Assigned employee'),
                                    ),
                                    items:
                                   GetAllEmployeesCubit.get(context)
                                        .filteredEmployees
                                        .map(
                                            (e) {

                                          return DropdownMenuItem<AllUserModel>
                                            (
                                              value: e,
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(left: 5),
                                                child: Text(e.name),
                                              ));
                                        }
                                    )
                                        .toList(),
                                    onChanged: (value)
                                    {
                                      AddNewTaskCubit.get(context).assignEmployee(value);
                                      AddNewTaskCubit.get(context).id = value!.id;
                                    },
                                  );
                                },
                              )

                              ,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomTextFormField(
                                hintText: 'Assigned Department',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter employee';
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
                                inputType: TextInputType.text,
                                controller: assignedDepartment),
                            SizedBox(
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 312.w,
                              height: 48.h,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      try {
                                        AddNewTaskCubit.get(context).addNewTask(
                                            CreateTaskModel(
                                          name: titleController.text,
                                          description: descriptionController.text,
                                          status: '0',
                                          startDate: x!,
                                          endDate: y!,
                                          employeeId: AddNewTaskCubit.get(context).id.toString(),
                                        ));
                                        print(x);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('created successfully')));
                                        // cubit.userLogin(emailController.text, passController.text);
                                        // GoRouter.of(context).push(AppRouter.home);

                                      } catch (error) {
                                        print(error);
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
                                    'Create',
                                    style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),),
                            ))
                          ]))

              )),
        );
      },
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.inputType,
    required this.controller,
    this.validator,
    this.maxLines
  }) : super(key: key);
  final String hintText;
  final TextInputType inputType;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines ;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: inputType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,

        border: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Color(0xff091E4A)),
      borderRadius: BorderRadius.circular(
        4,
      ),
    );
  }
}
