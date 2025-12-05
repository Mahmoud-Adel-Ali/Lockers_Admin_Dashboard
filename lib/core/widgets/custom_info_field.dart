import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomInfoField extends StatelessWidget {
  const CustomInfoField({
    super.key,
    this.color = AppColors.filedGrey,
    this.textColor = AppColors.main,
    this.title = '',
    this.info = '',
    this.titleStyle,
    this.infoStyle,
    this.body,
    this.suffixIcon,
    this.horizontal = 18,
    this.vertical = 16,
  });

  final Color color, textColor;
  final String title, info;
  final TextStyle? titleStyle, infoStyle;
  final Widget? body;
  final Widget? suffixIcon;
  final double horizontal, vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            ),
            child: Row(
              spacing: 12,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                info.isEmpty
                    ? Expanded(
                        child: InfoFieldTitle(
                          title: title,
                          titleStyle: titleStyle,
                          textColor: textColor,
                        ),
                      )
                    : InfoFieldTitle(
                        title: title,
                        titleStyle: titleStyle,
                        textColor: textColor,
                      ),
                // const Spacer(),
                suffixIcon ??
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Expanded(
                            child: Text(
                              info,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.end,
                              style:
                                  infoStyle ??
                                  AppTextStyles.style14w500(
                                    context,
                                  ).copyWith(color: textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          body ?? const SizedBox(),
        ],
      ),
    );
  }
}

class InfoFieldTitle extends StatelessWidget {
  const InfoFieldTitle({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.textColor,
  });

  final String title;
  final TextStyle? titleStyle;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style:
          titleStyle ??
          AppTextStyles.style14w500(context).copyWith(color: textColor),
    );
  }
}
