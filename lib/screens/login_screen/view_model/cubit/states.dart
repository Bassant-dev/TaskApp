abstract class TaskStates {}
class LoginInitialState extends TaskStates{}
class LoginLoadingState extends  TaskStates{}
class LoginSuccessState extends  TaskStates
{
    String? token;
  LoginSuccessState(this.token);

}
class LoginErrorState extends  TaskStates
{

}
class CheckSuccess extends  TaskStates
{}
class LogoutLoadingState extends  TaskStates{}