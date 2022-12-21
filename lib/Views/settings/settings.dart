import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Components/common_appBra.dart';

class SetingsVC extends StatelessWidget {
  const SetingsVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Settings"),
      body: Column(
        children: [
          SettingsTile(
            title: "Change Password",
            icon: Icons.apps,
            onTap: () {},
          ),
          SettingsTile(
            title: "Support",
            icon: Icons.support_agent,
            onTap: () {},
          ),
          SettingsTile(
            title: "Logout",
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    Key? key,
    this.icon,
    this.title,
    this.onTap,
  }) : super(key: key);

  final String? title;

  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: ListTile(
          onTap: onTap,
          leading: Icon(icon),
          title: Text(
            title!,
            style:
                Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
