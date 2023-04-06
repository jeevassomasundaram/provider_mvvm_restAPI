import 'package:flutter/material.dart';
import 'package:provider_with_mvvm/src/Resource/color/colors.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
     this.loading=false,
    required this.title,
    required this.onPress,
  });
  final String title;
  final bool loading;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonCOlor,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        width: 200,
        child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: const TextStyle(color: AppColors.whileColor),
                ),
        ),
      ),
    );
  }
}
