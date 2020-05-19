import 'package:flutter/cupertino.dart';

class LoaderService extends ChangeNotifier {
  bool _isLoading = true;

  get isLoading {
    return _isLoading;
  }

  void changeLoadingStatus(bool status) {
    _isLoading = status;
    notifyListeners();
  }}