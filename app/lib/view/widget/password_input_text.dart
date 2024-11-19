import 'package:flutter/material.dart';
import 'package:app/view/widget/input_text.dart';


class PasswordInputText extends StatefulWidget {
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validatorError;
  final String textName;
  final String exText;
  final FocusNode? focusNode;
  final bool withBolder;

  const PasswordInputText(
      {Key? key,
       this.textEditingController,
      this.validatorError,
      this.textName = "كلمة المرور",this.withBolder=false, this.focusNode, required this.exText})
      : super(key: key);

  @override
  _PasswordInputTextState createState() => _PasswordInputTextState();
}

class _PasswordInputTextState extends State<PasswordInputText> {
  late bool showPassword;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    showPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextInput(paddingHorizontal: 5,
      filled: true,
      showBorder: true,
      paddingVertical: 5,
      textEditingController: widget.textEditingController,
      wedgetIcon1: "assets/icons/pass.svg",
      text: widget.textName,
      labelText: widget.textName,
      withBolder: widget.withBolder,
      isRequired: true,
      exText: widget.exText,
      //BorderSideColor: kColorsPrimary.withOpacity(.2),
      obscureTxt: showPassword,
      validatorError: widget.validatorError,

      icon2: IconButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        icon: Icon(
          showPassword
              ? Icons.visibility_off_outlined
              : Icons.remove_red_eye_outlined,
          color: Colors.grey,
        ),
      ),
    );
  }
}
