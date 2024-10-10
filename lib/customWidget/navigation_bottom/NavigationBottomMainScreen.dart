import 'package:fastor_app_ui_widget/core/figma/Figma.dart';
import 'package:fastor_app_ui_widget/core/lang/LangApp.dart';
import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/constant/EnumNavigationBottomScreen.dart';
import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/logic/NavigationBottomController.dart';
import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/test/UnderDevelopmentNavigationScreen.dart';
import 'package:fastor_app_ui_widget/customWidget/navigation_bottom/widget/IconWithBadgeCounter.dart';
import 'package:flutter/material.dart';


class NavigationBottomMainScreen extends StatefulWidget {
  static double height = Figma.h(70);

  Widget? subPage;
  EnumNavigationBottomScreen enumNavigationBottomScreen;

  NavigationBottomMainScreen(
      {required this.enumNavigationBottomScreen, this.subPage});

  @override
  NavigationBottomMainState createState() => NavigationBottomMainState();
}

class NavigationBottomMainState extends State<NavigationBottomMainScreen> {
  //-------------------------------------------------------------------- variable

  bool isTypeMainPage = true;
  int selectedIndexNavigation = 0;
  var sizeIcon = Figma.h(22);


  static List<Widget> _mainPages = <Widget>[
    UnderDevelopmentNavigationScreen( "page 1"),
    UnderDevelopmentNavigationScreen( "page 2"),
    UnderDevelopmentNavigationScreen( "page 3"),
    UnderDevelopmentNavigationScreen( "page 4"),
    UnderDevelopmentNavigationScreen( "page 5"),
  ];


  @override
  void initState() {
    setIndexSelectedByEnumNavigationBottomScreenValue();
    setTypePageMainOrSub();
    super.initState();
  }

  //-------------------------------------------------------------------- build ui

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: isTypeMainPage
                ? choosePageMainBySelectedTab()
                : widget.subPage),
        bottomNavigationBar: Directionality(
            textDirection: LangApp.getTextDirection(),
            child: bottomBar()
        )
    );
  }

  /**
   *
   when need to make lister for counter notification of message

      CartCubit? cartCubit;

      bottomBarBlocBuilderCubitCart() {
          return BlocBuilder<CartCubit, CartState>(
          buildWhen: (previousState, currentState) {
          return currentState is CartItemListUpdatedState;
          }, builder: (context, state) {
          cartCubit = CartCubit.get(context);
          Log.i(
          "bottomBarBlocBuilderCubitCart() - update badge counter: ${cartCubit!.getCartCounterAboveNavigationBottom()}");
          return bottomBar();
          });
      }

   */

  void _onItemTapped(int index) {
    setState(() {
      setTypePageIsMainForEverWhenUserClickOneOfMainButtonWhileUserAtOneOfSubPage();
      selectedIndexNavigation = index;
    });
  }

  Color getColorSelectedOrNot(int indexItem) {
    if (indexItem == selectedIndexNavigation) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }


  Widget choosePageMainBySelectedTab() {
    return _mainPages.elementAt(selectedIndexNavigation);
  }


  BottomNavigationBar bottomBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Ensures labels are always shown
      backgroundColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: IconWithBadgeCounter(
              sizeIcon: sizeIcon,
              icon: Transform.flip(
                flipX: LangApp.isArabic,
                child: Icon(
                  Icons.pageview_outlined,
                  size: sizeIcon,
                  color: getColorSelectedOrNot(0),
                ),
              )),
          label: 'page 1'.tra(),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: IconWithBadgeCounter(
              sizeIcon: sizeIcon,
              icon:  Icon(
                Icons.pageview_outlined,
                size: sizeIcon,
                color: getColorSelectedOrNot(1),
              )
          ),
          label: 'page 2'.tra(),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: IconWithBadgeCounter(
              // counter: cartCubit!.getCartCounterAboveNavigationBottom(),
              sizeIcon: sizeIcon,
              icon: Icon(
                Icons.pageview_outlined,
                size: sizeIcon,
                color: getColorSelectedOrNot(2),
              )
          ),
          label: 'page 3'.tra(),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: IconWithBadgeCounter(
              sizeIcon: sizeIcon,
              icon: Icon(
                Icons.pageview_outlined,
                size: sizeIcon,
                color: getColorSelectedOrNot(3),
              )),
          label: 'page 4'.tra(),
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: IconWithBadgeCounter(
              sizeIcon: sizeIcon,
              icon:  Icon(
                Icons.pageview_outlined,
                size: sizeIcon,
                color: getColorSelectedOrNot(4),
              )
          ),
          label: 'page 5'.tra(),
        ),
      ],
      currentIndex: selectedIndexNavigation,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: _onItemTapped,
    );
  }


}
