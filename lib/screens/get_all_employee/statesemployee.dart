abstract class GetAllEmployeesState {}

class GetAllEmployeesInitial extends GetAllEmployeesState {

}
class GetAllEmployeesloading extends GetAllEmployeesState {}
class GetAllEmployeesSuccess extends GetAllEmployeesState {}
class GetAllEmployeesFailures extends GetAllEmployeesState {}
class AddDropDownSuccess extends GetAllEmployeesState {}
class ClearListSuccess extends GetAllEmployeesState {}
