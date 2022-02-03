import 'package:flutter/material.dart';
import 'package:qurany_karim/model/elder.dart';
import 'package:qurany_karim/model/error_result.dart';
import 'package:qurany_karim/repositories/elders/local_service.dart';
import 'states.dart';

class EldersViewModel extends ChangeNotifier {
  EldersViewModel() {
    states = EldersStates.Initial;
  }

  EldersStates states;

  List<Elder> _elders;

  List<Elder> get elders => _elders;

  ErrorResult _error;

  ErrorResult get error => _error;

  EldersLocalService _service = EldersLocalService();

  Future<void> getElders(BuildContext context) async {
    states = EldersStates.Loading;
    await _service.getElders(context: context).then((value) {
      value.fold((left) {
        _elders = left;
        states = EldersStates.Loaded;
      }, (right) {
        _error = right;
        states = EldersStates.Error;
      });
    });
    notifyListeners();
  }
}
