import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _SearchKey = '';
  String get SearchKey => _SearchKey;
  set SearchKey(String _value) {
    _SearchKey = _value;
  }

  String _videoURL = '';
  String get videoURL => _videoURL;
  set videoURL(String _value) {
    _videoURL = _value;
  }

  String _videoURLPath = 'https://www.youtube.com/watch?v=mwP1ZLuhjeU';
  String get videoURLPath => _videoURLPath;
  set videoURLPath(String _value) {
    _videoURLPath = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
