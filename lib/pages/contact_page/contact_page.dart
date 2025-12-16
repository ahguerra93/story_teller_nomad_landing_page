import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_outline_button.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/hamburger_menu.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/social_icons.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_padding.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ResponsiveLayout(
            desktop: Row(
              children: [
                Expanded(
                  child: SizedBox(height: double.maxFinite, child: _CoverImage()),
                ),
                Expanded(child: _ContactForm(isMobile: false)),
              ],
            ),
            mobile: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _ContactForm(isMobile: true),
                  _CoverImage(),
                ],
              ),
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: HamburgerMenu(
              darkMode: false,
              homeOptionEnabled: true,
            ),
          )
        ],
      ),
    );
  }
}

class _CoverImage extends StatelessWidget {
  const _CoverImage();

  @override
  Widget build(BuildContext context) {
    return CustomCloudImage(id: 'StorytellerNomad-5_hlhb4u', fit: BoxFit.cover);
  }
}

class _ContactForm extends StatefulWidget {
  const _ContactForm({required this.isMobile});
  final bool isMobile;

  @override
  State<_ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<_ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleFontSize = widget.isMobile ? 20.0 : 24.0;
    final subtitleFontSize = widget.isMobile ? 15.0 : 20.0;
    const color = Colors.black;

    return Container(
      color: Colors.white,
      child: ResponsivePadding(
        widePadding: EdgeInsets.symmetric(horizontal: 150.0, vertical: 30.0),
        desktopPadding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 30.0),
        mobilePadding: const EdgeInsets.all(20.0),
        tabletPadding: const EdgeInsets.all(30.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: 20,
                children: [
                  Text(
                    'Let\'s work together!',
                    style: TextStyle(fontSize: titleFontSize, fontWeight: FontWeight.bold, color: color),
                  ),
                  Text(
                    'Let me know about your project',
                    style: TextStyle(fontSize: subtitleFontSize, color: color),
                  ),
                  Row(
                    spacing: 20,
                    children: [
                      Expanded(
                          child: _TextFormField(
                        label: 'First Name',
                        isRequired: true,
                        mobile: widget.isMobile,
                      )),
                      Expanded(
                          child: _TextFormField(
                        label: 'Last Name',
                        isRequired: true,
                        mobile: widget.isMobile,
                      )),
                    ],
                  ),
                  _TextFormField(
                    label: 'Email',
                    mobile: widget.isMobile,
                    isRequired: true,
                    controller: _mailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  _TextFormField(
                    label: 'Message',
                    isRequired: true,
                    maxLines: null,
                    mobile: widget.isMobile,
                  ),
                  CustomOutlineButton(
                      text: 'CONTACT',
                      condensed: widget.isMobile,
                      onPressed: () {
                        if (!(_formKey.currentState?.validate() ?? false)) return;
                        // final resend = Resend.instance;
                        // resend.sendEmail(
                        //   from: 'contact@storytellernomad.com',
                        //   to: ['contact@storytellernomad.com'],
                        //   subject: '${_mailController.text} - New Contact Form Submission',
                        //   text: 'it works!',
                        // );
                      }),
                  Text(
                    'Or find me here',
                    style: TextStyle(fontSize: subtitleFontSize, fontWeight: FontWeight.bold, color: color),
                  ),
                  SocialIcons(darkMode: false, verticalOnMobile: false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({
    required this.label,
    this.isRequired = false,
    this.maxLines = 1,
    this.validator,
    this.mobile,
    this.controller,
  });
  final String label;
  final bool isRequired;
  final int? maxLines;
  final String? Function(String?)? validator;
  final bool? mobile;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(
        color: Colors.black,
        fontSize: mobile == true ? 14.0 : null,
      ),
      controller: controller,
      decoration: InputDecoration(
        labelText: isRequired ? '$label *' : label,
        labelStyle: TextStyle(fontSize: mobile == true ? 14.0 : null, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        hoverColor: Colors.black.withOpacity(0.1),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.5), width: 1),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator ??
          (isRequired
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your $label';
                  }
                  return null;
                }
              : null),
      maxLines: maxLines,
    );
  }
}
