import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerification extends StatefulWidget {
  /// number of OTP digits (e.g., 4 or 6)
  final int length;
  final void Function(String)? onCompleted;

  const OtpVerification({super.key, this.length = 4, this.onCompleted});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  late final List<TextEditingController> _controllers;
  late final List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.isNotEmpty) {
      final ch = value.characters.first;
      _controllers[index].text = ch;
      _controllers[index].selection = TextSelection.collapsed(offset: 1);

      if (index + 1 < widget.length) {
        FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
      } else {
        FocusScope.of(context).unfocus();
      }
    } else {
      if (index - 1 >= 0) {
        FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
        _controllers[index - 1].selection = TextSelection.collapsed(
          offset: _controllers[index - 1].text.length,
        );
      }
    }

    final code = _controllers.map((c) => c.text).join();
    if (!code.contains('') &&
        code.length == widget.length &&
        !code.contains(' ')) {
      widget.onCompleted?.call(code);
    }
  }

  Widget _buildBox(int index) {
    const double boxWidth = 77;
    const double boxHeight = 98;

    return Container(
      width: boxWidth,
      height: boxHeight,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: AppColors.grey, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        style: AppTextStyle.font22WhiteMedium,
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding: EdgeInsets.zero,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(1),
        ],
        onChanged: (val) => _onChanged(val, index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.length, (i) => _buildBox(i)),
    );
  }
}
