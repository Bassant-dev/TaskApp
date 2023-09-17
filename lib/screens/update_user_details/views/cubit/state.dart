abstract class UpdateUserDetailsStates {}
class InitialStateUpdateUserDetails extends  UpdateUserDetailsStates {}
class LoadingStateUpdateUserDetails extends  UpdateUserDetailsStates {}
class UpdateUserDetailsSuccessState extends UpdateUserDetailsStates
{}
class UpdateUserDetailsErrorState extends  UpdateUserDetailsStates
{}
class UpdateUserDetailsLoadingState extends  UpdateUserDetailsStates {}

class RadioCubitInitial extends UpdateUserDetailsStates{}
class RadioCubitSelected extends UpdateUserDetailsStates {
  final String selectedOption;

  RadioCubitSelected(this.selectedOption);
}