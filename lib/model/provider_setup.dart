import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:qinglong_tools/model/theme_model.dart';
import 'package:qinglong_tools/model/user_model.dart';

List<SingleChildStatelessWidget> providers = [
  ChangeNotifierProvider<ThemeModel>(
    create: (_) => ThemeModel(ThemeType.light),
  ),
  ChangeNotifierProvider<UserModel>(create: (_) => UserModel())
];
