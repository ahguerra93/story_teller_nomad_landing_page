import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/common/widgets/custom_outline_button.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_padding.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_text.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ResponsivePadding(
        desktopPadding: EdgeInsets.symmetric(vertical: 50),
        mobilePadding: EdgeInsets.only(top: 20, bottom: 35),
        child: ResponsiveLayout(
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                ),
                child: ResponsivePadding(
                  widePadding: const EdgeInsets.symmetric(horizontal: 200.0),
                  desktopPadding: const EdgeInsets.symmetric(horizontal: 150.0),
                  tabletPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Column(
                    children: [
                      _Title(),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _Logo(id: 'logo-mitsubishi_sz6thl', mobile: false),
                          _Logo(id: 'logo-onu_hq6aao', mobile: false),
                          _Logo(id: 'logo-UE_wzbtbw', mobile: false),
                          _Logo(id: 'logo-venado_wamb3r', mobile: false),
                          _Logo(id: 'logo-delizia_amhezx', mobile: false),
                          _Logo(id: 'logo-ugn_kf69iq', mobile: false),
                          _Logo(id: 'logo-HT_eoefl1', mobile: false),
                          _Logo(id: 'logo-crillon_jfrqya', mobile: false),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ResponsivePadding(
                  widePadding: const EdgeInsets.symmetric(horizontal: 150.0),
                  desktopPadding: const EdgeInsets.symmetric(horizontal: 100.0),
                  tabletPadding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: ResponsivePadding(
                          desktopPadding: const EdgeInsets.symmetric(horizontal: 25.0),
                          widePadding: const EdgeInsets.symmetric(horizontal: 25.0),
                          tabletPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                          mobilePadding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: const _Portrait(mobile: true),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 10),
                              const _ServicesHeader(mobile: false),
                              SizedBox(height: 20),
                              Flexible(child: SingleChildScrollView(child: const _Description(mobile: false))),
                              SizedBox(height: 20),
                              CustomOutlineButton(text: 'LET\'S WORK TOGETHER'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          mobile: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    _Title(),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        _Logo(id: 'logo-mitsubishi_sz6thl', mobile: true),
                        _Logo(id: 'logo-onu_hq6aao', mobile: true),
                        _Logo(id: 'logo-UE_wzbtbw', mobile: true),
                        _Logo(id: 'logo-venado_wamb3r', mobile: true),
                        _Logo(id: 'logo-delizia_amhezx', mobile: true),
                        _Logo(id: 'logo-ugn_kf69iq', mobile: true),
                        _Logo(id: 'logo-HT_eoefl1', mobile: true),
                        _Logo(id: 'logo-crillon_jfrqya', mobile: true),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                          child: Column(mainAxisSize: MainAxisSize.min, children: [
                            // const _Portrait(),
                            // SizedBox(height: 10),
                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 100, child: _Portrait(mobile: true)),
                                const _ServicesHeader(mobile: true),
                              ],
                            ),
                            SizedBox(height: 10),
                            const _Description(mobile: true),

                            SizedBox(height: 10),
                          ]),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomOutlineButton(
                      text: 'LET\'S WORK TOGETHER',
                      condensed: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return ResponsiveText(
      'BRANDS AND COMPANIES I\'VE HAD THE PLEASURE TO WORK WITH',
      mobileFontSize: 14,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, wordSpacing: 5, letterSpacing: 5),
      desktopFontSize: 20,
    );
  }
}

class _Portrait extends StatelessWidget {
  const _Portrait({
    required this.mobile,
  });
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: 400,
      ),
      child: ResponsivePadding(
          desktopPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          tabletPadding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          mobilePadding: const EdgeInsets.all(5.0),
          child: CustomCloudImage(id: 'portrait_tluflv')),
    );
  }
}

class _ServicesHeader extends StatelessWidget {
  const _ServicesHeader({required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Colors.black, fontWeight: FontWeight.w500, wordSpacing: 5, letterSpacing: 5);
    if (mobile) {
      return Text(
        'DOCUMENTARY\nTRAVEL\nCOMMERCIAL',
        style: style.copyWith(fontSize: 14),
      );
    }
    return ResponsiveText(
      'DOCUMENTARY | TRAVEL | COMMERCIAL',
      style: style,
      desktopFontSize: 18,
      wideFontSize: 18,
      mobileFontSize: 14,
      textAlign: TextAlign.center,
    );
  }
}

class _Description extends StatelessWidget {
  const _Description({required this.mobile});
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return Text(
      '''
Storyteller Nomad is my photography and filmmaking journey where I document travel, culture, and territory through an honest, sensitive, high-quality lens, always with a strong human focus. My work seeks to connect, through images, those who are far from these realities with the stories of extraordinary people.

I have more than 8 years of experience working with organizations and brands, and for the past 3 years I've been building my independent path. I specialize in creating high-level audiovisual content in diverse contexts, from documentary projects to tourism and corporate productions.

 I'm José Méndez, a filmmaker, photographer, and editor. For me, the image is not just a job—it's a passion and a tool to tell stories that deserve to be seen, understood, and remembered.''',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        wordSpacing: mobile ? 1.5 : 2.5,
        letterSpacing: mobile ? 1.5 : 2.5,
        height: mobile ? 1.5 : 2.0,
        fontSize: mobile ? 11 : 12,
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({required this.id, required this.mobile});
  final String id;
  final bool mobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: mobile ? 70 : 100,
      child: CustomCloudImage(
        id: id,
      ),
    );
  }
}
