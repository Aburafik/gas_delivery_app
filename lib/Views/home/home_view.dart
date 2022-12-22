import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/button_component.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';
import 'package:gas_delivery_app/Components/text_feild_component.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Utils/images.dart';
import 'package:gas_delivery_app/Views/payments/select_payment_method.dart';
import 'package:get/route_manager.dart';

class HomeView extends StatefulWidget {
  final int? id;
  final bool first;

  const HomeView({Key? key, this.id, required this.first}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? selectedValue;
  List cylinderSizes = ["20kg", "30kg", "40kg"];

  String? selectedSize;
  @override
  Widget build(BuildContext context) {
    if (widget.first) {
      return Scaffold(
        appBar: commonAppBar(title: "Request Order"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              titleText(context, "Pickup Address"),
              CommonTextField(),
              titleText(context, "Drop off Address"),
              CommonTextField(),
              titleText(context, "Cylinder Size"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: cylinderSizes
                        .map(
                          (e) => SelectCylinderSizeWidget(
                            size: e,
                            selectedSize: selectedSize == e,
                            onTap: () {
                              setState(() {
                                selectedSize = e;
                              });
                            },
                          ),
                        )
                        .toList()),
              ),
              titleText(context, "Cylinder Type"),
              RadioListTile(
                value: "Plastic",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: const Text("Plastic"),
              ),
              RadioListTile(
                value: "Metal",
                groupValue: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
                title: const Text("Metal"),
              ),
              titleText(context, "Reciever Name"),
              CommonTextField(),
              titleText(context, "Reciever Phone Number"),
              CommonTextField(),
              titleText(context, "Any Further Directions (Optional)"),
              CommonTextField(
                maxLines: 6,
              ),
              CommonButton(
                title: "Continue",
                onPressed: () => Get.toNamed(HomeViewNavigation.payment,
                    id: HomeViewNavigation.id),
              )
            ],
          ),
        ),
      );
    } else {
      return SelectPaymentMethodVC();
    }
  }

  titleText(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 16),
      ),
    );
  }
}

class SelectCylinderSizeWidget extends StatelessWidget {
  const SelectCylinderSizeWidget(
      {Key? key, this.size, this.onTap, this.selectedSize = false})
      : super(key: key);
  final String? size;
  final void Function()? onTap;

  final bool selectedSize;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 100,
        height: 100,
        child: Card(
          color: selectedSize ? AppColors.commonColor : null,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Images.gas_logo,
                  height: 30,
                ),
                Text(size!)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeViewNavigation {
  HomeViewNavigation._();

  static const id = 0;

  static const home = '/home';
  static const payment = '/payment';
}

class HomeViewsWrapper extends StatelessWidget {
  const HomeViewsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(HomeViewNavigation.id),
      onGenerateRoute: (home) {
        if (home.name == HomeViewNavigation.payment) {
          return GetPageRoute(
            routeName: HomeViewNavigation.payment,
            page: () => const HomeView(id: HomeViewNavigation.id, first: false),
          );
        } else {
          return GetPageRoute(
            routeName: HomeViewNavigation.home,
            page: () => const HomeView(id: HomeViewNavigation.id, first: true),
          );
        }
      },
    );
  }
}
