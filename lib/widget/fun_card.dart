import 'package:flutter/material.dart';

import '../pages/work_page.dart';

class FunCard extends StatelessWidget {
  final IconData funIcon;
  final String funText;
  const FunCard({super.key, required this.funIcon, required this.funText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WorkPage(),
                ),
              );
            },
            icon: Icon(
              funIcon,
              size: 24,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          funText,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF003F38),
          ),
        )
      ],
    );
  }
}
