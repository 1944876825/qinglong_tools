import 'package:flutter/material.dart';
import 'package:qinglong_tools/model/cron_search_model.dart';
import 'package:qinglong_tools/pages/add_edit_work_page.dart';
import 'package:qinglong_tools/widget/provider_widget.dart';

import '../widget/work_card.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  // with TickerProviderStateMixin
  // late AnimationController _animationController;
  // late CronSearchModel _cronSearchData;
  @override
  void initState() {
    super.initState();
    // _animationController = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 500));
    // _getWorkData();
    // Provider.of<CronSearchModel>(context, listen: false).update(3);
  }

  @override
  Widget build(BuildContext context) {
    // final _cronSearchData = context.watch<CronSearchModel>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          '定时任务',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddOrWorkPage(),
                ),
              );
            },
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
        ],
      ),
      body: ProviderWidget(
        model: CronSearchModel(),
        onReady: (model) {
          model.getCronSearchData();
        },
        builder: (context, model, child) {
          if (model.total > 0) {
            return Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: ListView(
                children: model.data!.map((e) {
                  return WorkCard(workData: e);
                }).toList(),
              ),
            );
          } else {
            return const Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
