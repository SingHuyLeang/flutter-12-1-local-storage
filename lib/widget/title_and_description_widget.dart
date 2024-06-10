import 'package:flutter/material.dart';

class TitleAndDescriptioWidget extends StatelessWidget {
  const TitleAndDescriptioWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Text(
          title,
          style: TextStyle(
            fontSize: 36,
            color: Colors.grey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        // description
        Text(
          description,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
