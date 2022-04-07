import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  const CheckBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset('assets/images/check.png'),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        TextUtils(
          text: 'I accept ',
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          underLine: TextDecoration.none,
        ),
        TextUtils(
          text: 'terms & conditions',
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 16,
          underLine: TextDecoration.underline,
        ),
      ],
    );
  }
}
