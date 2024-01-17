import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../constants/app_strings.dart';

class ForgotPwdWidget extends StatelessWidget {
  const ForgotPwdWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: BorderRadii.size_12,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.txtForgotPassword,
          style: textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontSize: BorderRadii.size_18,
          ),
        ),
      ),
    );
  }
}

class InputTextFieldWidgets extends StatefulWidget {
  const InputTextFieldWidgets({
    super.key,
    required this.userNameTxtController,
    required this.textTheme,
    required this.passwordTxtController,
  });

  final TextEditingController userNameTxtController;
  final TextTheme textTheme;
  final TextEditingController passwordTxtController;

  @override
  State<InputTextFieldWidgets> createState() => _InputTextFieldWidgetsState();
}

class _InputTextFieldWidgetsState extends State<InputTextFieldWidgets> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BorderRadii.size_10,
          ),
          child: SharedTextFieldWidget(
            textEditingController: widget.userNameTxtController,
            textTheme: widget.textTheme,
            hintTxt: AppStrings.txtEnterName,
            validatorFunction: sharedValidatorFunc,
          ),
        ),
        const SizedBox(
          height: BorderRadii.size_20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: BorderRadii.size_10,
          ),
          child: SharedTextFieldWidget(
            textEditingController: widget.passwordTxtController,
            textTheme: widget.textTheme,
            obsTxtVal: !isVisible,
            hintTxt: AppStrings.txtEnterPassword,
            validatorFunction: validatePassword,
            suffixIconWidget: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.txtHello,
          style: textTheme.displayLarge?.copyWith(
            fontSize: BorderRadii.size_24,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.txtSignInMsg,
          style: textTheme.headlineSmall?.copyWith(
            fontSize: BorderRadii.size_20,
          ),
        ),
      ],
    );
  }
}

class SharedTextFieldWidget extends StatelessWidget {
  const SharedTextFieldWidget({
    super.key,
    this.suffixIconWidget = const SizedBox(
      width: 0,
    ),
    required this.textEditingController,
    required this.validatorFunction,
    required this.textTheme,
    required this.hintTxt,
    this.keyBoardTypeVal,
    this.obsTxtVal = false,
    this.maxLines,
  });

  final TextEditingController textEditingController;
  final String? Function(String?)? validatorFunction;
  final TextTheme textTheme;
  final String hintTxt;
  final TextInputType? keyBoardTypeVal;
  final Widget suffixIconWidget;
  final bool obsTxtVal;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: BorderRadii.size_10),
          child: Text(
            hintTxt,
            style: textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 6),
        TextFormField(
          controller: textEditingController,
          validator: validatorFunction,
          style: textTheme.labelSmall?.copyWith(
            fontSize: BorderRadii.size_20,
          ),
          maxLines: maxLines ?? 1,
          keyboardType: keyBoardTypeVal,
          obscureText: obsTxtVal,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: BorderRadii.size_16,
              horizontal: BorderRadii.size_30,
            ),
            errorStyle: textTheme.labelSmall?.copyWith(
              fontSize: BorderRadii.size_14,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
            hintText: hintTxt,
            hintStyle: textTheme.labelSmall?.copyWith(
              fontSize: BorderRadii.size_20,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                BorderRadii.size_20,
              ),
              borderSide: const BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: inputTextFieldBorder(),
            errorBorder: inputTextFieldBorder(),
            focusedBorder: inputTextFieldBorder(),
            suffixIcon: suffixIconWidget,
          ),
        ),
      ],
    );
  }
}

OutlineInputBorder inputTextFieldBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(
      BorderRadii.size_20,
    ),
    borderSide: const BorderSide(
      color: Colors.black,
    ),
  );
}

String? sharedValidatorFunc(String? value) {
  if (value == null || value.trim() == '') {
    return AppStrings.txtFieldValidator;
  } else {
    return null;
  }
}

String? validatePassword(String? value) {
  if (!validateStructure(value!, Regex.passwordRegexExp)) {
    return AppStrings.txtValidatePassword;
  }
  return null;
}

bool validateStructure(String value, String pattern) {
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}

class Regex {
  static const String passwordRegexExp =
      r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
}

class SharedRichTextWidget extends StatelessWidget {
  const SharedRichTextWidget({
    super.key,
    required this.textTheme,
    required this.signUpOptionTapped,
    required this.text1,
    required this.text2,
  });

  final TextTheme textTheme;
  final void Function()? signUpOptionTapped;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: textTheme.bodySmall?.copyWith(
              fontSize: BorderRadii.size_18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = signUpOptionTapped,
            style: textTheme.bodySmall?.copyWith(
              fontSize: BorderRadii.size_18,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );
  }
}

class SharedActionButtonWidget extends StatelessWidget {
  const SharedActionButtonWidget({
    super.key,
    required this.screenWidth,
    required this.textTheme,
    required this.btnText,
  });

  final double screenWidth;
  final TextTheme textTheme;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth,
      height: BorderRadii.size_58,
      margin: const EdgeInsets.all(
        BorderRadii.size_18,
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(
          BorderRadii.size_18,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: BorderRadii.size_24,
          ),
        ),
      ),
    );
  }
}
