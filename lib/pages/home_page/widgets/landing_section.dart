import 'package:cloudinary_url_gen/transformation/layer/position/position.dart';
import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_outline_button.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_video/custom_cloud_video.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_text.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Stack(
        children: [
          Positioned.fill(
              child: CustomCloudVideo(
            id: 'Portada_ihyzc1',
            key: Key('Home-backgroundImage'),
          )),
          Positioned(
            top: 30,
            left: 30,
            child: Text('LOGO'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 16.0,
                children: [
                  ResponsiveText(
                    'PHOTOGRAPHER | FILMMAKER | FPV PILOT',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      letterSpacing: 5.0,
                    ),
                  ),
                  CustomOutlineButton(text: 'CONTACT', darkMode: true, onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
