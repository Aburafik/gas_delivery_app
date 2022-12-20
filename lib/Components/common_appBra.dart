import 'package:flutter/material.dart';

commonAppBar({bool canGoBack = false, String? title}) {
  return AppBar(
    elevation: .5,
    automaticallyImplyLeading: canGoBack,
    leadingWidth: 90,
    title: Text(title ?? ""),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications),
      )
    ],
  );
}
