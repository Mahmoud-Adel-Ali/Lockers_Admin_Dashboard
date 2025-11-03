// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lockers_admin_dashboard/core/utils/assets.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/profile_text_field.dart';
import 'video_preview_widget.dart';

Future<dynamic> showCustomerDataDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        title: 'بيانات حساب العميل',
        child: const ShowCustomerDataForm(),
      );
    },
  );
}

class ShowCustomerDataForm extends StatelessWidget {
  const ShowCustomerDataForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: AppColors.whiteGrey,
              backgroundImage: AssetImage(Assets.imagesTestUserImage),
            ),
          ),
          const SizedBox(),
          AbsorbPointer(
            absorbing: true,
            child: Column(
              spacing: 16,
              children: [
                ProfileTextField(
                  title: 'الإسم',
                  controller: TextEditingController(text: 'محمدخالد عبدالرازق'),
                ),
                ProfileTextField(
                  title: 'رقم الهاتف',
                  controller: TextEditingController(text: '+20 0108765243456'),
                ),
                ProfileTextField(
                  title: 'الإيميل',
                  controller: TextEditingController(
                    text: 'mohammed123@gmail.com',
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ShowLocationView.routeName);
            },
            child: AbsorbPointer(
              absorbing: true,
              child: ProfileTextField(
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.imagesGoogleMap,
                    width: 20,
                    height: 20,
                  ),
                ),
                controller: TextEditingController(
                  text: 'القاهرة - حي الزمالك - شارع الميرغاب',
                ),
              ),
            ),
          ),
          CustomerDataCardWidget(
            title: 'صور البطاقة الشخصية ( وجه البطاقة )',
            assetImage: Assets.imagesTestFaceCard,
          ),
          CustomerDataCardWidget(
            title: 'صور البطاقة الشخصية ( ظهر البطاقة )',
            assetImage: Assets.imagesTestBackCard,
          ),
          CustomerDataCardWidget(
            title: 'فيديو قصير',
            video: const VideoPreviewWidget(),
          ),
        ],
      ),
    );
  }
}

class CustomerDataCardWidget extends StatelessWidget {
  const CustomerDataCardWidget({
    super.key,
    required this.title,
    this.assetImage,
    this.video,
  });
  final String title;
  final String? assetImage;
  final Widget? video;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.filedGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(title, style: AppTextStyles.style16w400(context)),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            width: double.infinity,
            height: 260,
            decoration: BoxDecoration(
              color: AppColors.whiteGrey,
              borderRadius: BorderRadius.circular(8),
              image: assetImage == null
                  ? null
                  : DecorationImage(
                      image: AssetImage(assetImage!),
                      fit: BoxFit.cover,
                    ),
            ),
            child: video,
          ),
        ],
      ),
    );
  }
}
