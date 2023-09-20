abstract class UpdateDepStates {}
class InitialStateUpdateDep extends  UpdateDepStates{}
class LoadingStateUpdateDep extends   UpdateDepStates{}
class  UpdateDepSuccessState extends UpdateDepStates
{}
class  UpdateDepErrorState extends  UpdateDepStates
{}
class AddNewUserLoadingState extends  UpdateDepStates{}
class  DeleteDepSuccessState extends UpdateDepStates
{}
class DeleteDepErrorState extends  UpdateDepStates
{}
class DeleteDepLoadingState extends  UpdateDepStates{}