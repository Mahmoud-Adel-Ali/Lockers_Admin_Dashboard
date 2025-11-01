import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_search_field.dart';

class EmployeesSearchField extends StatelessWidget {
  const EmployeesSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomSearchField(hintText: 'ابحث عن موظف'),
      ),
    );
  }
}
