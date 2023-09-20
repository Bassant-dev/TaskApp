
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/component/component.dart';
import '../../../../core/model/model_login.dart';
import '../../view/cubit/cubit.dart';
import '../../view/cubit/cubitemplyee.dart';
import '../../view/cubit/departmenycubit.dart';
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
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.w, vertical: 48.h),
          child: SingleChildScrollView(
            child: BlocBuilder<AddNewTaskCubit, AddNewTaskState>(
                builder: (context, state) {
                  var cubit = BlocProvider.of<AddNewTaskCubit>(context);
                  return Form(
                      key: formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Add New Task!',
                                style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              'Create a new task now and \n assign it to employees right away. ',
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
                                      selectedDayHighlightColor:Colors.purpleAccent
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
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your title';
                                }
                                return null;
                              },
                              label: 'Title',
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            defaultFormField(
                              controller:descriptionController,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your description';
                                }
                                return null;
                              },
                              label: 'description',
                              maxline: 4
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    width: 1,
                                  )),
                              child:  DropdownButton(
                                onTap: ()async{
                                await BlocProvider.of<GetAllEmployeesCubit>(context).getAllEmployees();
                              },
                                underline: const SizedBox(),
                                value: cubit.valueChoose,
                                isExpanded: true,
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 16.w),
                                  child: const Text('Assigned employee'),
                                ),
                                items:
                                BlocProvider.of<GetAllEmployeesCubit>(context)
                                    .filteredEmployees
                                    .map(
                                      (e) => DropdownMenuItem<AllUserModel>(
                                      onTap: () async {
                                       cubit.id=e.id;

                                      },
                                      value: e,
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(left: 5),
                                        child: Text(e.name),
                                      )),
                                )
                                    .toList(),
                                onChanged: (value)
                                {
                                  // cubit.id = value!.id;
                                  cubit.assignEmployee(value);
                                },
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            defaultFormField(
                              controller: assignedEmployee,
                              type: TextInputType.emailAddress,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please enter your assignedEmployee';
                                }
                                return null;
                              },
                              label: 'assignedEmployee',
                            ),
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
                                        cubit.addNewTask(CreateTaskModel(
                                          name: titleController.text,
                                          description: descriptionController.text,
                                          status: '0',
                                          startDate: x!,
                                          endDate: y!,
                                          employeeId: cubit.id.toString(),
                                        ));
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('created successfully')));
                                        // cubit.userLogin(emailController.text, passController.text);
                                        // GoRouter.of(context).push(AppRouter.home);

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
                                      backgroundColor: Colors.purpleAccent),
                                  child: const Text('CREATE')),
                            )
                          ]));
                }),
          )),
    );
  }
}

DateTime setDate = DateTime.now();

Widget openDatePicker() {
  return Center(
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 60),
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
              ]),
          child: CalendarDatePicker(
            initialDate: setDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 100000)),
            onDateChanged: (DateTime value) {},
          )));
}