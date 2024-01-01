import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qinglong_tools/model/theme_model.dart';

List<SingleChildStatelessWidget> providers = [
  ChangeNotifierProvider(
    create: (_) => ThemeModel(ThemeType.light),
  ),
];
