import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({
    super.key,
    this.hintText = 'البحث',
    this.onChanged,
    this.controller,
  });

  final String hintText;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() => setState(() {})); // rebuild when text changes
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: TextField(
        controller: _controller,
        textInputAction: TextInputAction.search,
        cursorColor: AppColors.main,
        onChanged: widget.onChanged,
        style: AppTextStyles.style20w500(context).copyWith(color: Colors.black),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: AppTextStyles.style14w500(context),
          prefixIcon: const Icon(Icons.search, color: Colors.black54, size: 20),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.black54,
                    size: 20,
                  ),
                  onPressed: () {
                    _controller.clear();
                    widget.onChanged?.call('');
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: AppColors.main, width: 1.2),
          ),
        ),
      ),
    );
  }
}
