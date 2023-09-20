class CreateTaskModel {
  final String name;
  final String description;
  final String status;
  final String startDate;
  final String endDate;
  final String employeeId;

  CreateTaskModel(
      {required this.name,
        required this.description,
        required this.status,
        required this.startDate,
        required this.endDate,
        required this.employeeId});
  factory CreateTaskModel.fromJson(Map<String, dynamic> json) {
    return CreateTaskModel(
      name: json['name'],
      description: json['description'],
      status: json['status'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      employeeId: json['employee_id'],
    );
  }
}
