import 'package:flutter/material.dart';

import '../constants/app_images.dart';
import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';
import 'login_widgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController userNameTxtController = TextEditingController();
  final TextEditingController passwordTxtController = TextEditingController();
  final signinFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;

    signInBtnPasswordTapped() async {
      if (signinFormKey.currentState!.validate()) {
        if (!(context.mounted)) return;
      }
    }

    signUpBtnTapped() {}

    forgotPasswordTapped() {}

    return Container(
      width: screenWidth,
      height: screenHeight,
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            AppImages.signInBackgroundImg,
          ),
          scale: 0.5,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            margin: const EdgeInsets.all(BorderRadii.size_20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.2,
                    child: WelcomeMessage(textTheme: textTheme),
                  ),
                  const SizedBox(
                    height: BorderRadii.size_30,
                  ),
                  SizedBox(
                    height: screenHeight * 0.7,
                    child: Column(
                      children: [
                        Text(
                          AppStrings.txtUserLogin,
                          style: textTheme.titleLarge?.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: BorderRadii.size_32,
                        ),
                        Form(
                          key: signinFormKey,
                          child: InputTextFieldWidgets(
                            userNameTxtController: userNameTxtController,
                            textTheme: textTheme,
                            passwordTxtController: passwordTxtController,
                          ),
                        ),
                        const SizedBox(
                          height: BorderRadii.size_14,
                        ),
                        InkWell(
                          onTap: forgotPasswordTapped,
                          child: ForgotPwdWidget(
                            textTheme: textTheme,
                          ),
                        ),
                        const SizedBox(
                          height: BorderRadii.size_14,
                        ),
                        Column(
                          children: [
                            InkWell(
                              onTap: signInBtnPasswordTapped,
                              child: SharedActionButtonWidget(
                                screenWidth: screenWidth,
                                textTheme: textTheme,
                                btnText: AppStrings.txtSignIn,
                              ),
                            ),
                            const SizedBox(
                              height: BorderRadii.size_8,
                            ),
                            InkWell(
                              child: SharedRichTextWidget(
                                text1: AppStrings.txtDontHaveAccount,
                                text2: AppStrings.txtSignUp,
                                textTheme: textTheme,
                                signUpOptionTapped: signUpBtnTapped,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
