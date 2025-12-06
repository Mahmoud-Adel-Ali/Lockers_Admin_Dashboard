import 'package:flutter/material.dart';

import '../../../../../../core/utils/size_config.dart';
import '../../../../../../core/widgets/custom_dialog.dart';
import '../../../../../core/functions/convert_location_to_text.dart';
import '../../../../../core/models/location_details_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/views/show_location_view.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/custom_info_field.dart';
import '../../../data/models/customer_model.dart';
import 'video_preview_widget.dart';

Future<dynamic> showCustomerDataDialog(
  BuildContext context, {
  required CustomerModel customer,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        constraints: BoxConstraints(
          maxWidth: 500,
          maxHeight: SizeConfig.height * 0.95,
        ),
        title: 'بيانات حساب العميل',
        child: ShowCustomerDataForm(customer: customer),
      );
    },
  );
}

class ShowCustomerDataForm extends StatelessWidget {
  const ShowCustomerDataForm({super.key, required this.customer});
  final CustomerModel customer;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: 16,
        children: [
          Container(
            height: 160,
            width: 160,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: customCachedNetworkImageprovider(customer.image),
            ),
          ),
          const SizedBox(),
          Column(
            spacing: 16,
            children: [
              CustomInfoField(title: 'الإسم', info: customer.name),
              CustomInfoField(title: 'رقم الهاتف', info: customer.phone),
              CustomInfoField(title: 'الإيميل', info: customer.email),
            ],
          ),
          InkWell(
            onTap: () {
              LocationDetailsModel location = LocationDetailsModel(
                latitude: customer.latitude,
                longitude: customer.longitude,
                city: customer.city,
                neighborhood: customer.neighborhood,
                street: customer.street,
                buildingNum: customer.buildNumber,
                administrativeArea: customer.additionalAddress,
              );
              Navigator.of(
                context,
              ).pushNamed(ShowLocationView.routeName, arguments: location);
            },
            child: CustomInfoField(
              suffixIcon: Image.asset(
                Assets.imagesGoogleMap,
                width: 20,
                height: 20,
              ),
              title: convertLocationToText(
                context,
                city: customer.city,
                neighborhood: customer.neighborhood,
                street: customer.street,
                buildingNum: customer.buildNumber,
              ),
            ),
          ),
          CustomerDataCardWidget(
            title: 'صور البطاقة الشخصية ( وجه البطاقة )',
            imageUrl: customer.face,
          ),
          CustomerDataCardWidget(
            title: 'صور البطاقة الشخصية ( ظهر البطاقة )',
            imageUrl: customer.back,
          ),
          CustomerDataCardWidget(
            title: 'فيديو قصير',
            video: VideoPreviewWidget(videoUrl: customer.video),
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
    this.imageUrl,
    this.video,
  });
  final String title;
  final String? imageUrl;
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
              image: imageUrl == null
                  ? null
                  : customCachedNetworkImageprovider(imageUrl),
            ),
            child: video,
          ),
        ],
      ),
    );
  }
}
