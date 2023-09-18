import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/states.dart';

import '../../../../../core/component/component.dart';
import '../../../../core/cache_helper.dart';

class NewDepBody extends StatelessWidget {
  NewDepBody({Key? key}) : super(key: key);

  bool isvisible = false;
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "token"));
    return BlocConsumer<CubitDep, DepStates>(
      listener: (context, state) {

      if(state is DepSuccessState){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Create Successfully"),
            duration: Duration(seconds: 2), // Duration for which the toast will be displayed
          ),
        );}


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
                    Text('New Department!!', style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20.h),
                    Text(
                      'Create a new department now and assign a manager to start the work!',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: HexColor('#7C808A'),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20.h),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.emailAddress,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      label: 'Name',
                    ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: () async {
                        print("bassant");

                          // isvisible = true;
                        CacheHelper.getData(key:'token');
                         CubitDep.get(context).NameDep(nameController.text);

                        print("bassant");
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
