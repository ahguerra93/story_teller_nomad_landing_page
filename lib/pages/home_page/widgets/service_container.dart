import 'package:flutter/material.dart';

class ServiceContainer extends StatelessWidget {
  const ServiceContainer(
      {required this.description,
      required this.icon,
      required this.title,
      this.condensed = false,
      super.key});
  final String title;
  final IconData icon;
  final String description;
  final bool condensed;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withAlpha(125),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (condensed)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title, style: textTheme.bodyLarge),
                SizedBox(height: 20),
                Icon(
                  icon,
                  size: 30,
                ),
              ],
            )
          else
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                SizedBox(height: 20),
                Text(title, style: textTheme.bodyLarge),
              ],
            ),
          SizedBox(height: 20),
          Flexible(
            child: Text(
              description,
              style: textTheme.bodySmall,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }
}
