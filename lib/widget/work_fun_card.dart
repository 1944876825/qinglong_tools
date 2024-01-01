import 'package:flutter/material.dart';

class WorkFunCard extends StatefulWidget {
  final String funName;
  final IconData funIcon;
  final void Function(String funName, IconData funIcon) action;
  const WorkFunCard(
      {super.key,
      required this.funName,
      required this.funIcon,
      required this.action});

  @override
  State<WorkFunCard> createState() => _WorkFunCardState();
}

class _WorkFunCardState extends State<WorkFunCard> {
  @override
  Widget build(BuildContext context) {
    debugPrint('2 ${widget.funName}');
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            widget.action(widget.funName, widget.funIcon);
          },
          icon: Icon(
            widget.funIcon,
            size: 36,
            color: Colors.green[400],
          ),
        ),
        Text(
          widget.funName,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        // const SizedBox(),
      ],
    );
  }
}
