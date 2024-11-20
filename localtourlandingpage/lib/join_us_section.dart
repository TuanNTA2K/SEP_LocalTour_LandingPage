import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'join_us_card.dart'; // Import your JoinUsCard class

class JoinUsSection extends StatelessWidget {
  const JoinUsSection({Key? key}) : super(key: key);

  Future<void> _openCollaboratorForm() async {
    //https://docs.google.com/forms/d/1a_ircV9l9lObP62P_MUiS2u_gRW8Fm0lznkcjj4YMds/edit
    //https://docs.google.com/spreadsheets/d/1EL64g6lrPr_cA9fCQt-Q6V9Xr0AbZDydCseU3lzuLm0?resourcekey=&usp=forms_web_b&urp=linked#gid=1311444936( excel sheet)
    const url = 'https://docs.google.com/forms/d/e/1FAIpQLScEBp-rxYunvNFfv3cHmwUWLcMMRM54WYckvhHmRcjTtXa5RA/viewform?usp=sf_link';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _openPartnerForm() async {
    //https://docs.google.com/forms/d/1Emx5cb2yrl9aaq_S4IF3X7av-jHSbC4IMBvwL7S0-Ys/edit
    //https://docs.google.com/spreadsheets/d/1S73FGXw0LRiXJ0ehTV6h64LjCs5r2BjMaAO9fAmquJs/edit?resourcekey=&gid=1627318310#gid=1627318310( excel sheet)
    const url = 'https://docs.google.com/forms/d/e/1FAIpQLSciRbiAbZtfXxQKi7asTZo8l9-vsIRJD8HRzSSBIViVVfgggg/viewform?usp=sf_link';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height, // Full screen height
      child: Row(
        children: [
          JoinUsCard(
            title: "• Be Collaborator •",
            description:
            "You want to become our collaborator and develop the app with us?",
            buttonText: "Click here",
            buttonColor: Colors.green,
            imagePath: 'assets/images/collaborator.png',
            onButtonPressed: _openCollaboratorForm,
          ),
          JoinUsCard(
            title: "• Be Partner •",
            description: "You want to become a partner and do business with us?",
            buttonText: "Click here",
            buttonColor: Colors.blue,
            imagePath: 'assets/images/business.png',
            onButtonPressed: _openPartnerForm,
          ),
        ],
      ),
    );
  }
}
