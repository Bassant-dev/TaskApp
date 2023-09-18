import 'package:flutter/cupertino.dart';
import 'package:tasks_app_errasoft/screens/add_new_user/views_model/widget/add_new_user_body.dart';

import '../../../core/cache_helper.dart';

class AddNewUser extends StatelessWidget {
  const AddNewUser ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(CacheHelper.getData(key:'token'));
    return  AddNewUserBody();
  }
}
