import 'package:flutter/material.dart';
import 'package:folio/animations/bottomAnimation.dart';
import 'package:folio/widget/customBtn.dart';
import 'package:folio/widget/customTextHeading.dart';
import 'package:folio/widget/projectCard.dart';
import 'package:folio/constants.dart';

class PortfolioDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.02, vertical: height * 0.02),
      child: Column(
        children: [
          CustomSectionHeading(text: "\nRecent Project"),
          CustomSectionSubHeading(
              text: "Here are few samples of my previous work :)\n\n"),
          SizedBox(
            //  width: 1110,
            height: 246,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) {
                return VerticalDivider(
                  color: Colors.transparent,
                  width: width * 0.01,
                );
              },
              itemBuilder: (context, index) {
                return WidgetAnimator(
                  child: ProjectCard(
                    cardWidth: 435,
                    // cardHeight: 150,
                    backImage: kProjectsBanner[index],
                    projectIcon: kProjectsIcons[index],
                    projectTitle: kProjectsTitles[index],
                    projectDescription: kProjectsDescriptions[index],
                    projectLink: kProjectsLinks[index],
                  ),
                );
              },
              itemCount: 4,
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          OutlinedCustomBtn(
              btnText: "See More",
              onPressed: () {
                launchURL("https://github.com/Edwin10151");
              })
        ],
      ),
    );
  }
}
