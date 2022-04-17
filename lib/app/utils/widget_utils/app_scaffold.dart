import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold(
      {Key? key,
      required this.body,
      this.title,
      this.isScroll = false,
      this.showBackButton = true,
      this.onWillPop,
      this.padding,
      this.margin,
      this.safeArea = true,
      this.footer})
      : super(key: key);
  final Widget body;
  final String? title;
  final Function()? onWillPop;
  final bool isScroll;
  final bool showBackButton;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final bool safeArea;
  final Widget? footer;

  _willPopCallback() async {
    onWillPop?.call();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Stack(
        children: [
          Positioned.fill(
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: (title == null || title!.isEmpty)
                  ? null
                  : AppBar(
                      title: Text(title!),
                      centerTitle: true,
                      leading: showBackButton
                          ? IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.pop(context),
                              padding: EdgeInsets.zero,
                            )
                          : const SizedBox(),
                    ),
              body: Container(
                padding: padding,
                child: SafeArea(
                  top: safeArea,
                  bottom: safeArea,
                  left: safeArea,
                  right: safeArea,
                  child: body,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: footer ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
