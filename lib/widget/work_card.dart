import 'package:flutter/material.dart';

import '../model/work_model.dart';
import 'script_control.dart';

class WorkCard extends StatelessWidget {
  final WorkModel workData;
  // final void Function(BuildContext context) closeAction;
  const WorkCard({super.key, required this.workData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.only(
        left: 15.0,
        right: 10.0,
        top: 15.0,
        bottom: 5.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            workData.name,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    workData.command,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '2023:12:28 10:00',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    // barrierLabel: 'test',
                    // isScrollControlled: true,
                    builder: (context) => ScriptControl(workData: workData),
                  );
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 24,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
