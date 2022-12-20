import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';
import 'package:gas_delivery_app/Utils/colors.dart';

class ProlfileVC extends StatelessWidget {
  const ProlfileVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            color: AppColors.commonColor,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.09,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Container(),
                      Text(
                        "My Profile",
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: AppColors.whiteColor, fontSize: 20),
                      ),
                      Material(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          color: AppColors.whiteColor,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 20),
                            child: Text("Edit"),
                          ))
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: AppColors.greyColor,
                  ),
                ),
                const SizedBox(height: 15),
                Text("Citizen Raf",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColors.whiteColor, fontSize: 20))
              ],
            ),
          ),
          const ProfileTiles(
            title: "Phone Number",
            subTitle: "0551143980",
            icon: Icons.phone_android,
          ),
          const ProfileTiles(
            title: "Email Address",
            subTitle: "citizen@gmail.com",
            icon: Icons.email,
          ),
          const ProfileTiles(
            title: "Address",
            subTitle: "Tamale, Nyohini ",
            icon: Icons.phone_android,
          )
        ],
      ),
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({Key? key, this.icon, this.subTitle, this.title})
      : super(key: key);
  final String? title;
  final String? subTitle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
        subtitle: Text(subTitle!),
      ),
    );
  }
}
