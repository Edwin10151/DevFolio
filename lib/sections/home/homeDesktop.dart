import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/animations/entranceFader.dart';
import 'package:folio/constants.dart';
import 'package:folio/provider/themeProvider.dart';
import 'package:folio/widget/adaptiveText.dart';
import 'package:folio/widget/socialMediaIcon.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeProvider = Provider.of<ThemeProvider>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      // constraints: const BoxConstraints(maxHeight: 900, minHeight: 700),
      // decoration: const BoxDecoration(
      //   image: DecorationImage(
      //     fit: BoxFit.cover,
      //     image: AssetImage("assets/new_pic/bg_img_2.png"),
      //   ),
      // ),
      height: height - 50,
      width: width,
      child: Stack(
        children: [
          // Align(
          //   child: FittedBox(child: BlurBox(size: size)),
          //   alignment: Alignment.center,
          // ),
          Positioned(
            // top: width < 5500 ? height * 0.15 : height * 0.1,
            // right: width * 0.01,
            top: height * 0.1,
            right: 1,
            child: Opacity(
              opacity: 0.9,
              child: EntranceFader(
                offset: Offset(0, 0),
                delay: Duration(seconds: 1),
                duration: Duration(milliseconds: 800),
                child: Container(
                  height: height * 0.7,
                  width: width * 0.7,
                  child: Image.asset(
                    'assets/new_pic/mainpic.png',
                    // 'assets/1.png',
                    // height: width < 1200 ? height * 0.8 : height * 0.85,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin:
                EdgeInsets.fromLTRB(width * 0.1, height * 0.2, width * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AdaptiveText(
                      "WELCOME! ",
                      style: GoogleFonts.montserrat(
                        fontSize: height * 0.03,
                        fontWeight: FontWeight.w300,
                        color: _themeProvider.lightTheme
                            ? Colors.black
                            : Colors.white,
                      ),
                    ),
                    EntranceFader(
                      offset: Offset(0, 0),
                      delay: Duration(seconds: 2),
                      duration: Duration(milliseconds: 800),
                      child: Image.asset(
                        "assets/hi.gif",
                        height: height * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                AdaptiveText(
                  "Edwin",
                  style: GoogleFonts.montserrat(
                      fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                      fontWeight: FontWeight.w100,
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      letterSpacing: 4.0),
                ),
                AdaptiveText(
                  "Ting",
                  style: GoogleFonts.montserrat(
                      color: _themeProvider.lightTheme
                          ? Colors.black
                          : Colors.white,
                      fontSize: width < 1200 ? height * 0.085 : height * 0.095,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 5.0),
                ),
                EntranceFader(
                  offset: Offset(-10, 0),
                  delay: Duration(seconds: 1),
                  duration: Duration(milliseconds: 800),
                  child: Row(
                    children: [
                      Icon(
                        Icons.play_arrow_rounded,
                        color: kPrimaryColor,
                      ),
                      TyperAnimatedTextKit(
                          isRepeatingAnimation: true,
                          speed: Duration(milliseconds: 50),
                          textStyle: GoogleFonts.montserrat(
                            fontSize: height * 0.03,
                            fontWeight: FontWeight.w200,
                            color: _themeProvider.lightTheme
                                ? Colors.black
                                : Colors.white,
                          ),
                          text: [
                            " Software Development",
                            " Marching Learning",
                            " Tech Enthusiast"
                          ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    kSocialIcons.length,
                    (index) => WidgetAnimator(
                      child: SocialMediaIconBtn(
                        icon: kSocialIcons[index],
                        socialLink: kSocialLinks[index],
                        height: height * 0.035,
                        horizontalPadding: width * 0.005,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// class BlurBox extends StatelessWidget {
//   const BlurBox({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         GlassContent(size: size),
//         const Spacer(flex: 3),
//       ],
//     );
//   }
// }

// class GlassContent extends StatelessWidget {
//   const GlassContent({
//     Key? key,
//     required this.size,
//   }) : super(key: key);

//   final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(10),
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//         child: Container(
//           constraints: BoxConstraints(
//               maxWidth: size.width, maxHeight: size.height * 0.9),
//           width: double.infinity,
//           color: Colors.white.withOpacity(0.1),
//         ),
//       ),
//     );
//   }
// }
