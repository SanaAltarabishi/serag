import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:serag/core/resources/colors.dart';
import 'package:serag/core/resources/images.dart';
import 'package:serag/core/resources/strings.dart';
import 'package:serag/core/theme/theme_provider.dart';
import 'package:serag/core/utils/build_context_extensions.dart';
import 'package:serag/features/entryPages/presentation/first_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final String _text = AppStrings.appTitle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _controller.forward().whenComplete(_navigateToNextScreen);
  }

  void _navigateToNextScreen() {
    Future.delayed(const Duration(seconds: 1));
    Navigator.pushReplacement(
        context,
        PageTransition(
            child: const FirstPage(), type: PageTransitionType.fade));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      //  backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.brightness_6),
      //       onPressed: () {
      //         themeProvider.toggleTheme(); // Toggle between light and dark mode
      //       },
      //     ),
      //   ],
      // ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.getSplash(themeProvider.isDarkTheme),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: SlideTransition(
              position: _slideAnimation,
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Text(
                  _text,
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'ElMessiri',
                    fontSize: context.screenWidth * 0.15,
                    fontWeight: FontWeight.w900,
                    shadows: [
                      Shadow(
                          color: themeProvider.isDarkTheme
                              ? AppColors.darkGradientMiddle4
                              : AppColors.lightGradientMiddle1,
                          offset: const Offset(3, 2))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
