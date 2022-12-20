import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Views/home/home_view.dart';
import 'package:get/get.dart';

class SelectPaymentMethodVC extends StatefulWidget {
  const SelectPaymentMethodVC({super.key});

  @override
  State<SelectPaymentMethodVC> createState() => _SelectPaymentMethodVCState();
}

class _SelectPaymentMethodVCState extends State<SelectPaymentMethodVC> {
  bool cod = false;
  bool momopay = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(canGoBack: true, title: "Payment Methods"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Choose Payment Method",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            PaymentMethodComponent(
              title: "Cash on Delivery",
              icon: Icons.money,
              seletedType: cod,
              onTap: () {
                setState(() {
                  cod = true;
                  momopay = false;
                });
              },
            ),
            const SizedBox(height: 20),
            PaymentMethodComponent(
              title: "Mobile Noney",
              icon: Icons.phone_android_outlined,
              seletedType: momopay,
              onTap: () {
                setState(() {
                  cod = false;
                  momopay = true;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CommonButton(
                title: "Pay",
                onPressed: () {
                  Get.defaultDialog(
                      backgroundColor: AppColors.whiteColor.withOpacity(0.7),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      title: "",
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 40,
                              backgroundColor: AppColors.secondaryColor,
                              child: Icon(Icons.check,
                                  color: AppColors.whiteColor, size: 50),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                cod
                                    ? "Order Placed Succesfuly"
                                    : " Gas Order Succesfuly",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 20),
                              ),
                            ),
                            Text(
                              cod
                                  ? "Our Delivey agent will collect the delivery fee in cash before fullfilling your order"
                                  : "Money will be deducted from your account as soon as you have accepted the delivery ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(
                                    fontSize: 16,
                                  ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                      confirm: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CommonButton(
                          title: cod ? "OK" : "Confirm",
                          onPressed: cod
                              ? () {
                                  Get.back();
                                  Get.toNamed(HomeViewNavigation.home,
                                      id: HomeViewNavigation.id);
                                }
                              : () {},
                        ),
                      ));
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodComponent extends StatelessWidget {
  const PaymentMethodComponent(
      {Key? key, this.title, this.icon, this.onTap, this.seletedType = false})
      : super(key: key);
  final String? title;
  final void Function()? onTap;
  final IconData? icon;
  final bool seletedType;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      tileColor: seletedType ? AppColors.commonColor : AppColors.greyColor,
      leading: Icon(
        icon,
        color: seletedType ? AppColors.whiteColor : null,
      ),
      title: Text(
        title!,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 20,
            color: seletedType ? AppColors.whiteColor : AppColors.blackColor),
      ),
      onTap: onTap,
    );
  }
}
