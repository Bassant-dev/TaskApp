class UpdateTaskModel {
  final String id;
  final String taskName;
  final String description;
  final String status;
  final String startDate;
  final String endDate;


  UpdateTaskModel(
      {required this.id,required this.description,

        required this.taskName,
        required this.status,
        required this.startDate,
        required this.endDate,
      });
  factory UpdateTaskModel.fromJson(Map<String, dynamic> json) {
    return UpdateTaskModel(
      id: json['id'].toString(),
      description: json['description'],
      taskName: json['name'],
      status: json['status'],
      startDate: json['start date'],
      endDate: json['end date'],
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