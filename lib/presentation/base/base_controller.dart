import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier
    with WidgetsBindingObserver {
  BaseController() {
    _isMounted = true;
    initListeners();
  }

  late bool _isMounted = false;
  late GlobalKey<State<StatefulWidget>> _globalKey;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void initController(GlobalKey<State<StatefulWidget>> key) {
    _globalKey = key;
  }

  @protected
  BuildContext get context {
    assert(
      _globalKey.currentContext != null,
      'Make sure you are using the `globalKey` on your Scaffold',
    );

    return _globalKey.currentContext!;
  }

  @protected
  void initListeners() {}

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  @protected
  void refreshUI() {
    if (_isMounted) {
      notifyListeners();
    }
  }

  @protected
  void hideLoading() {
    _isLoading = false;
    refreshUI();
  }

  @protected
  void showLoading() {
    _isLoading = true;
    refreshUI();
  }

  void onInitState() {}

  @protected
  void onInActive() {}

  @protected
  void onPaused() {}

  @protected
  void onResumed() {}

  @protected
  void onInternetConnected() {}

  @protected
  void onInternetDisconnected() {}
}
