import 'package:flutter/material.dart';

import '../../core/cache_helper.dart';
import 'drawer.dart';

class Home_screen extends StatelessWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key: "token"));
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(icon: const Icon(Icons.menu),onPressed: (){
              Scaffold.of(context).openDrawer();

            });
          }
        ),
      ),
    );
  }
}
