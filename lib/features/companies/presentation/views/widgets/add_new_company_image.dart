import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/circular_button.dart';
import '../../manager/companies_provider.dart';

class AddNewCompanyImageSection extends StatelessWidget {
  const AddNewCompanyImageSection({super.key});

  @override
  Widget build(BuildContext context) {
    var prov = context.watch<CompaniesProvider>();
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        children: [
          if (prov.image == null)
            CircleAvatar(radius: 100, backgroundColor: AppColors.whiteGrey),
          if (prov.image != null)
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.grey),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(prov.image!.bytes),
                ),
              ),
            ),

          Positioned(
            bottom: 10,
            right: 15,
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularButton(
                child: Center(
                  child: Icon(
                    prov.image == null
                        ? Icons.camera_alt_outlined
                        : Icons.clear,
                    size: 15,
                  ),
                ),
                onPressed: () {
                  if (prov.image == null) {
                    prov.pickCompanyImage();
                  } else {
                    prov.clearImage();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
