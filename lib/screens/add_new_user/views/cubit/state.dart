abstract class AddNewUserStates {}
class InitialStateAdd extends  AddNewUserStates{}
class LoadingStateAdd extends   AddNewUserStates{}
class AddNewUserSuccessState extends AddNewUserStates
{}
class AddNewUserErrorState extends  AddNewUserStates
{}
class AddNewUserLoadingState extends  AddNewUserStates{}
class RadioCubitInitialadd extends AddNewUserStates{}
class RadioCubitSelectedadd extends AddNewUserStates {
  final String selectedOption;

  RadioCubitSelectedadd(this.selectedOption);
}
class GetAllUserStateLoading extends  AddNewUserStates
{}
class GetAllUserStateSuccess extends  AddNewUserStates
{}
class  GetAllUserStateFail extends  AddNewUserStates
{}