import 'package:flutter/material.dart';
import 'package:gas_delivery_app/Utils/colors.dart';
import 'package:gas_delivery_app/Views/home/home_view.dart';
import 'package:gas_delivery_app/Views/orders/orders.dart';
import 'package:gas_delivery_app/Views/profile/profile.dart';
import 'package:gas_delivery_app/Views/settings/settings.dart';

class DashBoardView extends StatefulWidget {
  DashBoardView({super.key, this.pageIndex});
  int? pageIndex;
  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> {
  int _pageIndex = 0;
  PageController? _pageController;

  List<Widget>? screens;
  @override
  void initState() {
    _pageIndex = widget.pageIndex!;

    _pageController = PageController(initialPage: widget.pageIndex!);

    screens = [
      const HomeViewsWrapper(),
      const OrdersVC(),
      const ProfileViewsWrapper(),
      const SetingsVC()
    ];
    super.initState();
  }

  void _setPage(int pageIndex) {
    setState(() {
      _pageController!.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          itemCount: screens!.length,
          itemBuilder: ((context, index) => screens![index])),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.commonColor,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _pageIndex,
        onTap: _setPage,
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Orders", icon: Icon(Icons.list)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          BottomNavigationBarItem(
              label: "More", icon: Icon(Icons.menu_rounded)),
        ],
      ),
    );
  }
}
