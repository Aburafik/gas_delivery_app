import 'package:flutter/material.dart';

commonAppBar({bool canGoBack = false, String? title}) {
  return AppBar(
    elevation: .5,
    automaticallyImplyLeading: canGoBack,
    leadingWidth: 90,
    title: Text(title ?? ""),
    leading: canGoBack
        ? null
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Welcome"),
                Text("User"),
              ],
            ),
          ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
    ],
  );
}
