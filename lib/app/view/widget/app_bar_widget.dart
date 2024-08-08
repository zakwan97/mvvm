// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:mvvm/app/constant/custom_colors.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  AppBarWidget({
    super.key,
    this.title,
    this.titleStyle,
    this.leading,
    this.showBackButton = true,
    this.actions,
    this.isHome,
    this.isDeleted,
    this.centerTitle,
    this.customTitle,
    this.elevation = 1,
    this.onBackButtonPressed,
    this.bottomLine = true,
    this.backgroundColor,
  }) : preferredSize = const Size.fromHeight(kToolbarHeight);
  final String? title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final bool? showBackButton;
  final List<Widget>? actions;
  final bool? isHome;
  final bool? isDeleted;
  final bool? centerTitle;
  final Widget? customTitle;
  final double? elevation;
  @override
  final Size preferredSize;
  final VoidCallback? onBackButtonPressed;
  final bool? bottomLine;
  final Color? backgroundColor;

  @override
  AppBarWidgetState createState() => AppBarWidgetState();
}

class AppBarWidgetState extends State<AppBarWidget> {
  TextStyle? getTitleStyle() {
    final theme = Theme.of(context);
    if (widget.titleStyle != null) {
      return widget.titleStyle;
    }

    return theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
  }

  Widget? getLeadingIcon() {
    if (widget.leading != null) {
      return widget.leading;
    }

    if (widget.showBackButton ?? false) {
      return IconButton(
        splashRadius: 18,
        icon: const Icon(
          Icons.arrow_back_ios,
          color: CustomColors.grey50,
        ),
        onPressed: () {
          //
          Navigator.of(context).maybePop();
          widget.onBackButtonPressed?.call();
        },
      );
    }

    return null;
  }

  Widget getTitle() {
    if (widget.isHome ?? false) {
      return Image.asset('assets/images/logo_mx_white.png');
    }

    if (widget.isDeleted ?? false) {
      return Image.asset('assets/images/icon-mx.png');
    }

    if (widget.customTitle != null) {
      return widget.customTitle!;
    }

    return Text(
      widget.title ?? '',
      style: getTitleStyle(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: widget.backgroundColor ?? Colors.white,
        elevation: 0,
        titleSpacing: widget.showBackButton ?? false ? 0 : 16,
        leading: getLeadingIcon(),
        automaticallyImplyLeading: false,
        centerTitle: widget.centerTitle ?? false,
        title: getTitle(),
        actions: widget.actions,
        bottom: widget.bottomLine == true
            ? PreferredSize(
                preferredSize: const Size.fromHeight(10.0),
                child: Container(
                  color: CustomColors.grey30,
                  height: 0.5,
                ),
              )
            : null);
  }
}
