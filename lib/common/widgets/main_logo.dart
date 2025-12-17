import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    this.darkMode = false,
    this.redirectToHome = true,
    this.height,
    super.key,
  });
  final bool darkMode;
  final bool redirectToHome;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: redirectToHome
          ? () {
              context.go('/');
            }
          : null,
      child: SizedBox(
          height: height ?? 50,
          child: CustomCloudImage(id: darkMode ? 'sn-logo-dark_a89dhy' : 'sn-logo-light_q4x0qa', fit: BoxFit.contain)),
    );
  }
}
