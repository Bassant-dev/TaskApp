import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/bloc_observer.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/cubit.dart';
import 'package:tasks_app_errasoft/screens/login_screen/view_model/cubit/states.dart';
import 'package:tasks_app_errasoft/screens/login_screen/views/login_screen.dart';



void main() {

  Bloc.observer = MyBlocObserver();
  //DioHelper.Init_dio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CubitTask())
      ],
      child: BlocConsumer<CubitTask,TaskStates>(
        listener: (context,state){},
        builder: (context,state){
          return ScreenUtilInit(
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(

              ),
              home: const Login(),
            ),
          );
        },

      ),
    );
  }
}

