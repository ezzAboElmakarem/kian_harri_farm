import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kian_sheeps_projects/helper/is_arabic_method.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomAppPinCodeField extends StatefulWidget {
  final void Function(String?)? onSave;
  //final void Function(String) onChanged;

  const CustomAppPinCodeField({
    super.key,
    this.onSave,
  });

  @override
  State<CustomAppPinCodeField> createState() => _CustomAppPinCodeFieldState();
}

class _CustomAppPinCodeFieldState extends State<CustomAppPinCodeField> {
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  String currentText = "";

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      keyboardType: TextInputType.number,
      errorTextDirection: isArabic() ? TextDirection.rtl : TextDirection.ltr,
      errorTextSpace: 25,
      validator: (v) {
        if (v!.length < 4) {
          return "من فضلك أدخل الكود";
        } else {
          return null;
        }
      },
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 70.h,
        fieldWidth: 68.w,
        activeFillColor: Colors.white,
      ),
      animationDuration: Duration(milliseconds: 300),
      // backgroundColor: Colors.blue.shade50,
      //  enableActiveFill: true,
      errorAnimationController: errorController,
      controller: textEditingController,
      onCompleted: (v) {
        print("Completed");
      },
      onChanged: (value) {
        print(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        print("Allowing to paste $text");
        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
        //but you can show anything you want here, like your pop up saying wrong paste format or etc
        return true;
      },
      appContext: context,
    );
  }
}
