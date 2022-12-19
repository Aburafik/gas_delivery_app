import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';
import 'package:gas_delivery_app/Utils/colors.dart';

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
            
            Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CommonButton(
                title: "Pay",
                onPressed: () {},
              ),
            ),
            Spacer(),
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
      contentPadding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
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
