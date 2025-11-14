// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/enum/locker_size.dart';
import '../../../../../core/functions/check_unauthenticated.dart';
import '../../../../../core/functions/is_arabic.dart';
import '../../../../../core/functions/show_loading_dialog.dart';
import '../../../../../core/functions/snack_bar.dart';
import '../../../../../core/models/locker_model.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_dropdown_field.dart';
import '../../../../../core/widgets/dialog_helper.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/units_provider.dart';

Future<dynamic> editLockerDialog(
  BuildContext context, {
  required LockerModel locker,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        title: 'تعديل بيانات الخزينة',
        constraints: BoxConstraints(maxWidth: 400, maxHeight: 300),
        child: EditLockerForm(locker: locker),
      );
    },
  );
}

class EditLockerForm extends StatefulWidget {
  const EditLockerForm({super.key, required this.locker});
  final LockerModel locker;

  @override
  State<EditLockerForm> createState() => _EditLockerFormState();
}

class _EditLockerFormState extends State<EditLockerForm> {
  List<LockerSize> lockerSizes = [
    LockerSize.small,
    LockerSize.medium,
    LockerSize.large,
  ];

  LockerSize? selectedLockerSize;

  @override
  void initState() {
    super.initState();
    selectedLockerSize = widget.locker.size;
    log('${widget.locker.size}');
  }

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<UnitsProvider>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        children: [
          const SizedBox(),
          // CustomTextFormField(hintText: 'رقم الخزينة'),
          CustomDropdownTextField<LockerSize>(
            hintText: 'تغيير حجم الخزينة',
            itemLabel: (e) => isArabic() ? e.arName : e.enName,
            items: lockerSizes,
            onChanged: (value) => setState(() => selectedLockerSize = null),
            onSelected: (value) => setState(() => selectedLockerSize = value),
          ),
          SizedBox(height: 16),
          CustomButton(
            text: 'إضافة',
            onPressed: () async {
              if (selectedLockerSize != null) {
                //* Show Loading Dialog
                showLoadingDialog(context);

                await prov.updateLockerInUnit(
                  id: widget.locker.id,
                  size: selectedLockerSize!,
                );

                //* Close Loading Dialog
                Navigator.pop(context);

                if (prov.checkUpdatingLockerInUnit == true) {
                  //* Close Dialog
                  Navigator.pop(context);
                  showSuccessSnackBar(context, msg: prov.message);
                } else if (prov.checkUpdatingLockerInUnit == false) {
                  checkUnauthenticated(context, msg: prov.message);
                  DialogHelper.showErrorDialog(
                    context,
                    title: S.of(context).error,
                    desc: prov.message,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
