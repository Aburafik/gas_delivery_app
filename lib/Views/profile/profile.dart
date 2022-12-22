import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Views/profile/edit_profile.dart';
import 'package:get/get.dart';

class ProfileVC extends StatelessWidget {
  const ProfileVC({super.key, this.first, this.id});
  final int? id;
  final bool? first;
  @override
  Widget build(BuildContext context) {
    if (first!) {
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
                          style: Theme.of(context)
                              .textTheme
                              .headline1!
                              .copyWith(
                                  color: AppColors.whiteColor, fontSize: 20),
                        ),
                        GestureDetector(
                          child: Material(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            color: AppColors.whiteColor,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              child: Text("Edit"),
                            ),
                          ),
                          onTap: () => Get.toNamed(
                              ProfileViewNavigation.editProfile,
                              id: ProfileViewNavigation.id),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Center(
                    child: CircleAvatar(

                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMGltYWdlc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"),
                      backgroundColor: AppColors.greyColor,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Citizen Raf",
                    style: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(color: AppColors.whiteColor, fontSize: 20),
                  )
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
    } else {
      return const EditProfileVC();
    }
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
        subtitle: Text(subTitle!),
      ),
    );
  }
}

class ProfileViewNavigation {
  ProfileViewNavigation._();

  static const id = 1;

  static const profile = '/profile';
  static const editProfile = '/editProfile';
}

class ProfileViewsWrapper extends StatelessWidget {
  const ProfileViewsWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(ProfileViewNavigation.id),
      onGenerateRoute: (home) {
        if (home.name == ProfileViewNavigation.editProfile) {
          return GetPageRoute(
            routeName: ProfileViewNavigation.editProfile,
            page: () =>
                const ProfileVC(id: ProfileViewNavigation.id, first: false),
          );
        } else {
          return GetPageRoute(
            routeName: ProfileViewNavigation.profile,
            page: () =>
                const ProfileVC(id: ProfileViewNavigation.id, first: true),
          );
        }
      },
    );
  }
}
