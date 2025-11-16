import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomLabeledCheckBox extends StatefulWidget {
  final String label;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const CustomLabeledCheckBox({
    super.key,
    required this.label,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<CustomLabeledCheckBox> createState() => _CustomLabeledCheckBoxState();
}

class _CustomLabeledCheckBoxState extends State<CustomLabeledCheckBox> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _toggleValue(bool? newValue) {
    setState(() {
      _value = newValue ?? false;
    });
    widget.onChanged(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl, // Arabic layout
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: () => _toggleValue(!_value),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            children: [
              Checkbox(
                value: _value,
                onChanged: _toggleValue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                activeColor: AppColors.green,
              ),
              Expanded(
                child: Text(
                  widget.label,
                  style: AppTextStyles.style16w500(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
