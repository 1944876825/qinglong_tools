import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProviderWidget<T extends ChangeNotifier> extends StatefulWidget {
  final T model;
  final Widget? child;
  final Widget Function(
    BuildContext context,
    T value,
    Widget? child,
  ) builder;
  void Function(T)? onReady;

  ProviderWidget({
    super.key,
    required this.model,
    required this.builder,
    this.child,
    this.onReady,
  });

  @override
  State<ProviderWidget<T>> createState() => _ProviderWidgetState<T>();
}

class _ProviderWidgetState<T extends ChangeNotifier>
    extends State<ProviderWidget<T>> {
  @override
  void initState() {
    if (widget.onReady != null) {
      widget.onReady!(widget.model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (_) => widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
