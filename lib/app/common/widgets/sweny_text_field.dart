import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweny/app/common/theme/app_colors.dart';

/*
 *  Text Field Utama untuk Aplikasi SWENY
 *  Dark style sesuai design system
 *
 *  REUSABLE TEXT FIELD COMPONENT
 */

class SwenyTextField extends StatefulWidget {
  const SwenyTextField({
    super.key,
    this.label,
    this.hint,
    this.isPassword = false,
    this.prefixIcon,
    this.errorText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
  });

  final String? label;
  final String? hint;
  final bool isPassword;
  final IconData? prefixIcon;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;

  @override
  State<SwenyTextField> createState() => _SwenyTextFieldState();
}

class _SwenyTextFieldState extends State<SwenyTextField> {
  bool _obscure = true;
  bool _isFocused = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasError = widget.errorText != null && widget.errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: GoogleFonts.dmSans(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _isFocused ? AppColors.primaryLight : AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 8),
        ],

        // Input container
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: AppColors.bgElevated,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: hasError
                  ? AppColors.error
                  : _isFocused
                      ? AppColors.borderFocus
                      : AppColors.border,
              width: _isFocused ? 1.5 : 1.0,
            ),
            boxShadow: _isFocused
                ? [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.12),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            obscureText: widget.isPassword && _obscure,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            readOnly: widget.readOnly,
            autofocus: widget.autofocus,
            maxLines: widget.isPassword ? 1 : widget.maxLines,
            onChanged: widget.onChanged,
            onSubmitted: widget.onSubmitted,
            style: GoogleFonts.dmSans(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: AppColors.textPrimary,
            ),
            cursorColor: AppColors.primaryLight,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.dmSans(
                fontSize: 15,
                color: AppColors.textHint,
              ),
              // Remove default border — we handle it with AnimatedContainer
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              filled: false,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 14, right: 10),
                      child: Icon(
                        widget.prefixIcon,
                        size: 18,
                        color: _isFocused
                            ? AppColors.primaryLight
                            : AppColors.textHint,
                      ),
                    )
                  : null,
              prefixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() => _obscure = !_obscure),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14),
                        child: Icon(
                          _obscure
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          size: 18,
                          color: _isFocused
                              ? AppColors.primaryLight
                              : AppColors.textHint,
                        ),
                      ),
                    )
                  : null,
              suffixIconConstraints: const BoxConstraints(
                minWidth: 0,
                minHeight: 0,
              ),
            ),
          ),
        ),

        // Error text
        if (hasError) ...[
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(
                Icons.error_outline,
                size: 12,
                color: AppColors.error,
              ),
              const SizedBox(width: 4),
              Text(
                widget.errorText!,
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  color: AppColors.error,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
