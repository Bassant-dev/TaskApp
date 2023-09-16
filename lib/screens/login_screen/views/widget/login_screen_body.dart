import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';

import '../../../../../core/component/component.dart';
import '../../view_model/cubit/cubit.dart';


class LoginScreenBody extends StatelessWidget {
  LoginScreenBody({Key? key}) : super(key: key);

  bool isvisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitTask,TaskStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 48),
            child: Form(
              key: formKey,
              child: Column(

                children: [
                  Text('Welcome Back!', style: GoogleFonts.roboto(fontSize: 24,fontWeight: FontWeight.bold)),
                  SizedBox(height: 20.h),
                  Text(
                    'Login to access your assigned tasks and personal overview',
                    style: GoogleFonts.roboto(
                      fontSize: 16.sp,
                      color: HexColor('#7C808A'),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.h),
                  defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    label: 'Email',
                  ),
                  SizedBox(height: 20.h),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    label: 'Password',
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Checkbox(value: CubitTask.get(context).ischeck, onChanged: (value) {
                        CubitTask.get(context).checkis(value);
                      }),
                      SizedBox(width: 8.h),
                      Text('Keep me logged in', style: GoogleFonts.roboto(fontSize: 16)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        isvisible = true;
                        CubitTask.get(context).login(emailController.text, passwordController.text);
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
                      'LOGIN',
                      style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
