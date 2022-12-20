import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Utils/images.dart';

class OrdersVC extends StatelessWidget {
  const OrdersVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Material(
                          child: Image.asset(
                            Images.fire_logo,
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Gas Station",
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20,fontWeight: FontWeight.w400)),
                              Text("Delivery Data"),
                            ],
                          ),
                        ),
                        const Material(
                            color: AppColors.primaryColor,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text("Completed"),
                            ))
                      ],
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Order",
                              style: TextStyle(color: AppColors.greyColor),
                            ),
                            Text("Cylinder Exchange"),
                            Padding(
                              padding: EdgeInsets.only(top: 20, bottom: 5),
                              child: Text("Cylinder Size",
                                  style: TextStyle(color: AppColors.greyColor)),
                            ),
                            Text("11KG"),
                          ],
                        ),
                        Column(
                          children: [
                            const Text("Cylinder Type",
                                style: TextStyle(color: AppColors.greyColor)),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 5),
                              child: const Text("Metal"),
                            ),
                            Material(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppColors.ratingBarColor)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 8),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: AppColors.ratingBarColor,
                                    ),
                                    Text(
                                      "Rate Us",
                                      style: TextStyle(
                                          color: AppColors.ratingBarColor),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
