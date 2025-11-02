import 'package:flutter/material.dart';

import 'widgets/employees_selector_field.dart';

class EmployeesView extends StatelessWidget {
  const EmployeesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(child: EmployeesSelectorField()),
              //
            ],
          ),
        ],
      ),
    );
  }
}
