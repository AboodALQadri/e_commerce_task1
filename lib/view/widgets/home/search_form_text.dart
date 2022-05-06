import 'package:e_commerce_task1/logic/controllers/product_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

  final _controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return TextField(
          style: const TextStyle(
            color: Colors.black,
          ),
          controller: _controller.searchTextController,
          onChanged: (searchName) {
            _controller.addSearchToList(searchName);
          },
          cursorColor: Colors.black,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(

            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
            suffixIcon: _controller.searchTextController.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _controller.clearSearch();
                    },
                    icon: const Icon(Icons.close),
                  )
                : null,
            hintText: 'Search with name & price',
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }
}
