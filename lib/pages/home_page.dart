import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/theme_model.dart';
import '../widget/fun_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.home,
            color: Theme.of(context).primaryColor,
            size: 20,
          ),
        ),
        title: Text(
          '青龙APP',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeModel>(context, listen: false).reverse();
            },
            icon: Icon(
              Icons.light_mode,
              color: Theme.of(context).primaryColor,
              size: 24,
            ),
          )
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        childAspectRatio: 1 / 1.1,
        children: const [
          FunCard(
            funIcon: Icons.timer,
            funText: '定时任务',
          ),
        ],
      ),
    );
  }
}
