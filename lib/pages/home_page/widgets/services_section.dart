import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_teller_nomad_landing_page/pages/home_page/widgets/service_container.dart';
import 'package:story_teller_nomad_landing_page/widgets/custom_cloud_image/custom_cloud_image.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_text.dart';
import 'package:story_teller_nomad_landing_page/widgets/responsive/responsive_widget.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomCloudImage(
            id: 'services_section_gwa2gg',
            key: Key('services-backgroundImage'),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        ResponsiveLayout(
          desktop: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              ResponsiveText(
                'SERVICIOS',
                style: Theme.of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(color: Theme.of(context).primaryColor),
                mobileFontSize:
                    Theme.of(context).textTheme.displaySmall?.fontSize,
              ),
              SizedBox(height: 10),
              SizedBox(height: 60),
              Row(
                children: [
                  Expanded(
                    child: ServiceContainer(
                      icon: CupertinoIcons.camera,
                      title: 'FOTOGRAFIA COMERCIAL',
                      description:
                          'Creo que la fotografia es más que simplemente tomar imágenes: se trata de ver el mundo a través de un lente y encontrar la belleza en lugares inesperados.'
                          ' Con un ojo agudo para los detalles y un enfoque creativo.'
                          ' Estoy dedicado a convertir momentos ordinarios en obras de arte extraordinarias.',
                    ),
                  ),
                  Expanded(
                    child: ServiceContainer(
                      icon: CupertinoIcons.film,
                      title: 'PRODUCCIONES AUDIOVISUALES',
                      description:
                          'Adéntrate en el mundo de la narración con mis servicios de cine.'
                          ' Estoy aqui para dar vida a tu visión, capturando y entrelazando momentos que hacen que tu historia merezca ser contada.'
                          ' Desde el primer plano hasta los créditos finales, utilizo la magia del cine para asegurarme de que tu mensaje se escuche alto y claro.',
                    ),
                  ),
                  Expanded(
                    child: ServiceContainer(
                      icon: Icons.widgets,
                      description:
                          'Las redes sociales son una herramienta poderosa que puede ayudarte a hacer crecer tu negocio, aumentar tu influencia y conectarte con personas de todo el mundo.'
                          ' Con mis servicios de exposición en redes sociales, utilizo mi conocimiento de la industria para ayudarte a aprovechar el poder de las redes sociales y alcanzar tus objetivos.',
                      title: 'PUBLICIDAD',
                    ),
                  ),
                ],
              ),
            ],
          ),
          mobile: LayoutBuilder(builder: (context, constraints) {
            return SizedBox(
              height: constraints.maxHeight,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  ResponsiveText(
                    'SERVICIOS',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Theme.of(context).primaryColor),
                    mobileFontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ServiceContainer(
                      icon: Icons.widgets,
                      description:
                          'Las redes sociales son una herramienta poderosa que puede ayudarte a hacer crecer tu negocio, aumentar tu influencia y conectarte con personas de todo el mundo.'
                          ' Con mis servicios de exposición en redes sociales, utilizo mi conocimiento de la industria para ayudarte a aprovechar el poder de las redes sociales y alcanzar tus objetivos.',
                      title: 'PUBLICIDAD',
                      condensed: true,
                    ),
                  ),
                  Expanded(
                    child: ServiceContainer(
                      icon: CupertinoIcons.film,
                      title: 'PRODUCCIONES AUDIOVISUALES',
                      description:
                          'Adéntrate en el mundo de la narración con mis servicios de cine.'
                          ' Estoy aqui para dar vida a tu visión, capturando y entrelazando momentos que hacen que tu historia merezca ser contada.'
                          ' Desde el primer plano hasta los créditos finales, utilizo la magia del cine para asegurarme de que tu mensaje se escuche alto y claro.',
                      condensed: true,
                    ),
                  ),
                  Expanded(
                    child: ServiceContainer(
                      icon: CupertinoIcons.camera,
                      title: 'FOTOGRAFIA COMERCIAL',
                      description:
                          'Creo que la fotografia es más que simplemente tomar imágenes: se trata de ver el mundo a través de un lente y encontrar la belleza en lugares inesperados.'
                          ' Con un ojo agudo para los detalles y un enfoque creativo.'
                          ' Estoy dedicado a convertir momentos ordinarios en obras de arte extraordinarias.',
                      condensed: true,
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }
}
