import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            maxRadius: 144,
            backgroundColor: Colors.grey,
            child: CircleAvatar(
                maxRadius: 140,
                backgroundImage: AssetImage('assets/minelogo.png')),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.blueGrey,
            thickness: 3.0,
            indent: 30.0,
            endIndent: 30.0,
          ),
          Text('View Some Other Projects'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse('https://github.com/FardeenKhaan')),
                  icon: SvgPicture.asset('assets/icons8-github.svg')),
              SizedBox(
                width: 5,
              ),
              IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse('https://linkedin.com/in/fardeenkhan51')),
                  icon: SvgPicture.asset('assets/icons8-linkedin-logo.svg')),
              IconButton(
                  onPressed: () async => await launchUrl(
                      Uri.parse('https://www.instagram.com/fardeenkhaan70/')),
                  icon: Image.asset(
                    'assets/icons8-instagram-logo-94.png',
                    width: 50,
                    height: 50,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
