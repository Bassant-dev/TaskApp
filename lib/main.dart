import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app_errasoft/core/bloc_observer.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/Home_screen.dart';
import 'package:tasks_app_errasoft/screens/Home_Screen/drawer.dart';
import 'package:tasks_app_errasoft/screens/add_new_user/views/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/login_screen/views/login_screen.dart';
import 'package:tasks_app_errasoft/screens/new_department/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/update_department/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/update_user_details/views/cubit/cubit.dart';

import 'core/cache_helper.dart';
import 'core/dio_helper.dart';



void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.Init_dio();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CubitTask()),
        BlocProvider(create: (context)=> CubitDep()),
        BlocProvider(create: (context)=> CubitNewUser()),
        BlocProvider(create: (context)=>  CubitUpdateDep()),
        BlocProvider(create: (context)=> CubitUpdateUserDetails())


      ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
          ),
          home: const Login(),
        ),
      ),
    );
  }
}

