import 'package:flutter/material.dart';
import 'package:flutter_food_app/pages/home/home_page_body.dart';
import 'package:flutter_food_app/utils/colors.dart';
import 'package:flutter_food_app/utils/dimensions.dart';
import 'package:flutter_food_app/widgets/big_text.dart';
import 'package:flutter_food_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          Container(
              child: Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.only(
                left: Dimensions.width20, right: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  BigText(text: "Country", color: AppColors.mainColor),
                  Row(children: [
                    SmallText(text: "City", color: Colors.black54),
                    const Icon(Icons.arrow_drop_down)
                  ])
                ]),
                Container(
                    width: Dimensions.height45,
                    height: Dimensions.height45,
                    // ignore: sort_child_properties_last
                    child: Icon(Icons.search,
                        color: Colors.white, size: Dimensions.iconSize24),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor))
              ],
            ),
          )),
          const Expanded(
            child: SingleChildScrollView(
              child: FoodPageBody(),
            ),
          ),
        ],
      ),
    );
  }
}
