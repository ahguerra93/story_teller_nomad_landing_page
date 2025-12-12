import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_video/custom_cloud_video.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_text.dart';

class LandingSection extends StatelessWidget {
  const LandingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: CustomCloudVideo(
          id: 'Portada_ihyzc1',
          key: Key('Home-backgroundImage'),
        )),
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ResponsiveText(
                'Storyteller Nomad',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.bold),
                wideFontSize: 95,
                desktopFontSize: 85,
                tabletFontSize: Theme.of(context).textTheme.displayLarge?.fontSize,
                mobileFontSize: Theme.of(context).textTheme.displayMedium?.fontSize,
              ),
              SizedBox(height: 16),
              ResponsiveText(
                'Photographer - Filmmaker - FPV pilot',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
                wideFontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
                desktopFontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                tabletFontSize: Theme.of(context).textTheme.headlineSmall?.fontSize,
                mobileFontSize: Theme.of(context).textTheme.labelLarge?.fontSize,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
