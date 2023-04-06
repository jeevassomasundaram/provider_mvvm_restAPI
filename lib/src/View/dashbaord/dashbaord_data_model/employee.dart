



class Employee {
    Employee({
        required this.id,
        required this.employeeName,
        required this.employeeSalary,
        required this.employeeAge,
        required this.profileImage,
    });

    int id;
    String employeeName;
    int employeeSalary;
    int employeeAge;
    String profileImage;

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["id"],
        employeeName: json["employee_name"],
        employeeSalary: json["employee_salary"],
        employeeAge: json["employee_age"],
        profileImage: json["profile_image"],
    );

   
}
