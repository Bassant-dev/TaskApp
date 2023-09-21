class TasksModel {
  final String id;
  final String taskName;
  final String status;
  final String startDate;
  final String endDate;
  final CreatorModel creatorModel;
  final EmployeeModel employeeModel;

  TasksModel(
      {required this.id,
        required this.employeeModel,
        required this.taskName,
        required this.status,
        required this.startDate,
        required this.endDate,
        required this.creatorModel});
  factory TasksModel.fromJson(Map<String, dynamic> json) {
    return TasksModel(employeeModel: EmployeeModel.fromJson(json['employee']),
      creatorModel: CreatorModel.fromJson(json['creator']),
      id: json['id'].toString(),
      taskName: json['name'],
      status: json['status'],
      startDate: json['start date'],
      endDate: json['end date'],
    );
  }
}
class CreatorModel {
  final String id;
  final String name;
  final String email;
  final String user_type;

  CreatorModel({
    required this.id,
    required this.name,
    required this.email,
    required this.user_type,
  });
  factory CreatorModel.fromJson(Map<String, dynamic> json) {
    return CreatorModel(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      user_type: json['user_type'],
    );
  }
}

class EmployeeModel {
  final String name;
  final String id;
  final String userType;
  final String email;
  EmployeeModel({required this.name, required this.userType,required this.email,required this.id});

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(id: json['id'].toString(),
        name: json['name'],
        userType: json['user_type'],
        email: json['email']
    );
  }
}


