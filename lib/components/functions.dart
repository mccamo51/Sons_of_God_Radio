import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

String fbProtocolUrl;
fbPage() async {
  if (Platform.isIOS) {
    fbProtocolUrl = 'fb://profile/237748633428303';
  } else {
    fbProtocolUrl = 'fb://page/237748633428303';
  }

  String fallbackUrl = 'https://facebook.com/SonsOfGodBibleMinistry';

  try {
    bool launched = await launch(fbProtocolUrl, forceSafariVC: false);

    if (!launched) {
      await launch(fallbackUrl, forceSafariVC: false);
    }
  } catch (e) {
    await launch(fallbackUrl, forceSafariVC: false);
  }
}

whatsapplaunch(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print("Not supported");
  }
}

youtubelaunchURL() async {
  if (Platform.isIOS) {
    if (await canLaunch(
        'youtube:https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ')) {
      await launch(
          'youtube:https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ',
          forceSafariVC: false);
    } else {
      if (await canLaunch(
          'https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ')) {
        await launch(
            'https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ');
      } else {
        throw 'Could not launch https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ';
      }
    }
  } else {
    const url = 'https://www.youtube.com/channel/UCUb3_8AzsuKPhQSCyRQ2WeQ';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

launchURLMap() async {
  final String googleMapslocationUrl = "https://goo.gl/maps/HacHoaMw9WC74h6t9";

  final String encodedURl = Uri.encodeFull(googleMapslocationUrl);

  if (await canLaunch(encodedURl)) {
    await launch(encodedURl);
  } else {
    print('Could not launch $encodedURl');
    throw 'Could not launch $encodedURl';
  }
}

