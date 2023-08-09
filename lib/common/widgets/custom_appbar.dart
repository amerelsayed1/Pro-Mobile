import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackArrow;
  final bool showLeadingArrow;
  final bool showTitleSpacing;
  final bool centerTitle;
  final double elevation;
  final Color? backgroundColor;
  final Color? backIconColor;
  final Widget? leading;
  final List<Widget>? actionsWidget;
  final TextStyle? titleStyle;

  @override
  Size get preferredSize => AppBar()
      .preferredSize; // Size.fromHeight(kToolbarHeight); // Size.fromHeight(34);

  const CustomAppBar({
    Key? key,
    this.title = "",
    this.showBackArrow = false,
    this.showLeadingArrow = true,
    this.showTitleSpacing = false,
    this.centerTitle = false,
    this.elevation = 0,
    this.leading,
    this.backgroundColor,
    this.actionsWidget,
    this.titleStyle,
    this.backIconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.transparent,
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
      automaticallyImplyLeading: true,
      backgroundColor: backgroundColor ?? Colors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      title: Text(
        title,
        style: titleStyle ??
            const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
      ),
      titleSpacing: showTitleSpacing ? 20 : 5,
      leading: InkWell(
        child: showBackArrow
            ? Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.all(3),
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
              )
            : Container(),
        onTap: () {
          if (showBackArrow) {
            context.pop();
          } else {
            Scaffold.of(context).openDrawer();
          }
        },
      ),
      actions: actionsWidget,
    );
  }
}
