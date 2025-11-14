import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

class CustomDropdownTextField<T> extends StatefulWidget {
  const CustomDropdownTextField({
    super.key,
    required this.items,
    required this.itemLabel,
    this.onSelected,
    this.value,
    this.hintText,
    this.validator,
    this.controller,
    this.selectedTrailingIcon,
    this.onChanged,
  });

  /// List of items of any type
  final List<T> items;

  /// Function to get the label for each item
  final String Function(T) itemLabel;

  final T? value;
  final String? hintText;
  final String? Function(T?)? validator;
  final ValueChanged<T?>? onSelected;
  final TextEditingController? controller;
  final Widget? selectedTrailingIcon;
  final void Function(String)? onChanged;

  @override
  State<CustomDropdownTextField<T>> createState() =>
      _CustomDropdownTextFieldState<T>();
}

class _CustomDropdownTextFieldState<T>
    extends State<CustomDropdownTextField<T>> {
  late TextEditingController _controller;
  late List<T> _filteredItems;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _filteredItems = widget.items;

    // Apply external onChanged listener if provided
    _controller.addListener(() {
      final text = _controller.text;
      widget.onChanged?.call(text);
      _filterItems(text);
    });
  }

  void _filterItems(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredItems = widget.items;
      } else {
        _filteredItems = widget.items
            .where(
              (item) => widget
                  .itemLabel(item)
                  .toLowerCase()
                  .contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<T>(
      controller: _controller,
      onSelected: widget.onSelected,
      hintText: widget.hintText,
      requestFocusOnTap: true,
      enableFilter: false, // we handle filtering manually
      expandedInsets: EdgeInsets.zero,
      selectedTrailingIcon: widget.selectedTrailingIcon,
      textStyle: AppTextStyles.style20w700(context),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: AppTextStyles.style16w400(context),
        fillColor: AppColors.white,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.phosphorGreen),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: AppColors.grey),
        ),
      ),
      // Limit dropdown height to show max 5 items
      menuHeight: (_filteredItems.length > 5)
          // each item ≈ 60px height
          ? 5 * 60.0
          : _filteredItems.length * 60.0,
      dropdownMenuEntries: _filteredItems
          .map(
            (item) => DropdownMenuEntry<T>(
              label: widget.itemLabel(item),
              value: item,
              style: ButtonStyle(
                padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                textStyle: WidgetStatePropertyAll(
                  AppTextStyles.style20w400(context),
                ),
                overlayColor: const WidgetStatePropertyAll(AppColors.white),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }
}
