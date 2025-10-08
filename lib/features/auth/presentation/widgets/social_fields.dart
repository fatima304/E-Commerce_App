import 'package:ecommerce_app/core/helper/app_icon.dart';
import 'package:ecommerce_app/core/routes/routes.dart';
import 'package:ecommerce_app/core/theme/app_color.dart';
import 'package:ecommerce_app/core/theme/app_text_style.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:ecommerce_app/features/auth/presentation/widgets/social_item.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';

class AuthFields extends StatelessWidget {
  const AuthFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      children: [
        SocialItem(color: AppColors.blue, name: 'Facebook', img: AppICons.face),
        SocialItem(
          color: AppColors.lightBlue,
          name: 'Twitter',
          img: AppICons.x,
        ),
        SocialItem(color: AppColors.red, name: 'Google', img: AppICons.google),
        Spacer(),
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Already have an account? ',
                  style: AppTextStyle.font13DarkGreyRegular,
                ),
                TextSpan(
                  text: 'Signin',
                  style: AppTextStyle.font13BlackMedium,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        MainButton(
          text: 'Create an Account',
          onTap: () {
            Navigator.pushNamed(context, Routes.registerScreen);
          },
        ),
      ],
    );
  }
}
