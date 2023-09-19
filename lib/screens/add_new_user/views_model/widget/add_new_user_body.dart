import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/states.dart';

import '../../../../../core/component/component.dart';
import '../../../../core/cache_helper.dart';
import '../../../update_user_details/views/cubit/state.dart';
import '../../views/cubit/cubit.dart';
import '../../views/cubit/state.dart';

class AddNewUserBody extends StatelessWidget {
  AddNewUserBody({Key? key}) : super(key: key);

  bool isvisible = false;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "token"));
    return BlocConsumer< CubitNewUser, AddNewUserStates>(
      listener: (context, state) {
        if(state is AddNewUserSuccessState){
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Create Successfully"),
              duration: Duration(seconds: 2), // Duration for which the toast will be displayed
            ),
          );

        }

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
                    Text('Add New User!', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.h),
                    Text(
                      'Create a new user now and assign them tasks right away.',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      label: 'Name',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      label: 'Email',
                    ),

                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller:phoneController,
                      type: TextInputType.phone,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone';
                        }
                        return null;
                      },
                      label: 'Phone',
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.name,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      label: 'Password',
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Radio(
                          value: 'Option 1',
                          groupValue: CubitNewUser .get(context).state is RadioCubitSelectedadd
                              ? (CubitNewUser .get(context).state as RadioCubitSelectedadd).selectedOption
                              : null,
                          onChanged: (value) {
                            CubitNewUser .get(context).selectOption(value!);
                          },
                        ),
                        Text('Admin'),

                        Radio(
                          value: 'Option 2',
                          groupValue: CubitNewUser .get(context).state is RadioCubitSelectedadd
                              ? (CubitNewUser .get(context).state as RadioCubitSelectedadd).selectedOption
                              : null,
                          onChanged: (value) {
                            CubitNewUser .get(context).selectOption(value!);
                          },

                        ),
                        Text('User'),

                        Radio(
                          value: 'Option 3',
                          groupValue: CubitNewUser .get(context).state is RadioCubitSelectedadd
                              ? (CubitNewUser .get(context).state as RadioCubitSelectedadd).selectedOption
                              : null,
                          onChanged: (value) {
                            CubitNewUser .get(context).selectOption(value!);
                          },

                        ),
                        Text('Department'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {

                        final String name = nameController.text;
                        final String email = emailController.text;
                        final String phone = phoneController.text;
                        final String password = passwordController.text;

                        if (formKey.currentState!.validate()) {
                         print("bbbbbb");
                          CubitNewUser.get(context).addUser(
                            name: name,
                            email: email,
                            phone: phone,
                            password: password,
                            choosetype: '1'

                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: HexColor('#5A55CA'),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        minimumSize: Size(312, 48),
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
