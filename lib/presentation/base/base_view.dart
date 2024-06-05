// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:food_hub/presentation/base/base_controller.dart';
import 'package:provider/provider.dart';

abstract class BaseWidget<Controller extends BaseController>
    extends BasePage<Controller> {
  BaseWidget({Key? key, required super.controller}) : super(key: key);
}

abstract class BasePage<Controller extends BaseController>
    extends StatefulWidget {
  final Controller controller;
  final bool autoDispose;

  late final globalKey = GlobalKey<State<StatefulWidget>>();

  BasePage({
    required this.controller,
    this.autoDispose = true,
    Key? key,
  }) : super(key: null);

  @protected
  Widget get view;

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState<Controller>(
      controller: controller,
      view: view,
      key: globalKey,
      autoDispose: autoDispose,
    );
  }
}

class _BaseViewState<Controller extends BaseController>
    extends _ViewState<BasePage<Controller>, Controller> {
  late final Widget _view;
  late final GlobalKey<State<StatefulWidget>> key;

  _BaseViewState({
    required Controller controller,
    required Widget view,
    required GlobalKey<State<StatefulWidget>> key,
    bool autoDispose = true,
  }) : super(controller: controller, key: key, autoDispose: autoDispose) {
    _view = view;
  }

  @override
  @protected
  Widget get view => _view;
}

abstract class _ViewState<Page extends StatefulWidget,
    Controller extends BaseController> extends State<Page> {
  late final Controller controller;
  final bool autoDispose;

  _ViewState({
    required this.controller,
    required GlobalKey<State<StatefulWidget>> key,
    this.autoDispose = true,
  }) {
    controller.initController(key);
    WidgetsBinding.instance.addObserver(controller);
  }

  Widget get view;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Controller>.value(
      value: controller,
      child: view,
    );
  }

  @override
  void initState() {
    super.initState();
    controller.onInitState();
  }

  @override
  @mustCallSuper
  void dispose() {
    if (autoDispose) controller.dispose();
    WidgetsBinding.instance.removeObserver(controller);
    super.dispose();
  }
}

typedef ControlledBuilder<Controller extends BaseController> = Widget Function(
  BuildContext context,
  Controller controller,
);

class ControlledWidgetBuilder<Controller extends BaseController>
    extends StatelessWidget {
  final ControlledBuilder<Controller> builder;

  const ControlledWidgetBuilder({
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (BuildContext context, Controller controller, _) => builder(
        context,
        controller,
      ),
    );
  }
}
