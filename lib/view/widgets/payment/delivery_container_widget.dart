import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';

class DeliveryContainerWidget extends StatefulWidget {
  const DeliveryContainerWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryContainerWidget> createState() =>
      _DeliveryContainerWidgetState();
}

class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
  int radioContainerIndex = 1;
  bool changeColor = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRadioContainer(
          title: 'Uzay Shop',
          name: 'Uzay store',
          phone: '059-1234-567',
          address: 'Gaza , AL-Remal Street',
          value: 1,
          color: changeColor ? Colors.white : Colors.grey.shade300,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        buildRadioContainer(
          title: 'Delivery',
          name: 'Abood AL-Qadri',
          phone: '056-707-4004',
          address: 'Gaza , AL-Remal Street',
          value: 2,
          color: changeColor ? Colors.grey.shade300 : Colors.white,
          onChanged: (int? value) {
            setState(() {
              radioContainerIndex = value!;
              changeColor = !changeColor;
            });
          },
        ),
      ],
    );
  }

  Widget buildRadioContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String title,
    required String name,
    required String phone,
    required String address,
  }) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3.0,
            blurRadius: 5.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Radio(
            value: value,
            groupValue: radioContainerIndex,
            onChanged: (int? value) {
              onChanged(value);
            },
            fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  text: title,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: name,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: phone,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 5,
                ),
                TextUtils(
                  text: address,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                  underLine: TextDecoration.none,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
