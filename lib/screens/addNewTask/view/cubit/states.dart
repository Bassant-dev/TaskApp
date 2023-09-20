// abstract class AddNewTaskStates {
//
// }
// class InitialStateAddNewTask extends  AddNewTaskStates {}
// class LoadingStateAddNewTask extends  AddNewTaskStates {}
// class AddNewTaskSuccessState extends AddNewTaskStates
// {}
// class AddNewTaskErrorState extends  AddNewTaskStates
// {}


abstract class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}
class AddNewTaskSuccess extends AddNewTaskState {}
class AddNewTaskFailure extends AddNewTaskState {}
class ChangedAssignedEmployeeSuccess extends AddNewTaskState {}