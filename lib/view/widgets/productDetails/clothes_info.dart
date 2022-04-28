import 'package:e_commerce_task1/logic/controllers/product_controller.dart';
import 'package:e_commerce_task1/utils/theme.dart';
import 'package:e_commerce_task1/view/widgets/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int productId;
  final double rate;
  final String description;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.productId,
    required this.rate,
    required this.description,
  }) : super(key: key);

  final _controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(
                () {
                  return Container(
                    padding: const EdgeInsetsDirectional.all(8),
                    decoration: BoxDecoration(
                      color: Get.isDarkMode
                          ? Colors.white.withOpacity(0.9)
                          : Colors.grey.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                    child: InkWell(
                      onTap: () {
                        _controller.manageFavourites(productId);
                      },
                      child: _controller.isFavourites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 20,
                            )
                          : const Icon(
                              Icons.favorite_outline,
                              color: Colors.black,
                              size: 20,
                            ),
                    ),
                  );
                },
              )
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: '$rate',
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                underLine: TextDecoration.none,
              ),
              const SizedBox(
                width: 8,
              ),
              RatingBar(
                rating: rate,
                icon: const Icon(
                  Icons.star,
                  size: 20,
                  color: Colors.grey,
                ),
                size: 20,
                starCount: 5,
                spacing: 1,
                isIndicator: false,
                allowHalfRating: true,
                onRatingCallback: (value, isIndicator) {
                  isIndicator.value = true;
                },
                color: Colors.orangeAccent,
              ),
            ],
          ),
          ReadMoreText(
            description,
            trimLines: 3,
            textAlign: TextAlign.justify,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show More',
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            trimExpandedText: 'Show Less',
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              height:2,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
