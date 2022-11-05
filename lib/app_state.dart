import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _swipableListIndex =
        prefs.getInt('ff_swipableListIndex') ?? _swipableListIndex;
    _recentSearches =
        prefs.getStringList('ff_recentSearches') ?? _recentSearches;
  }

  late SharedPreferences prefs;

  bool searchActive = false;

  bool timerRunning = false;

  int _swipableListIndex = 0;
  int get swipableListIndex => _swipableListIndex;
  set swipableListIndex(int _value) {
    _swipableListIndex = _value;
    prefs.setInt('ff_swipableListIndex', _value);
  }

  bool searchActive2 = false;

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> _value) {
    _recentSearches = _value;
    prefs.setStringList('ff_recentSearches', _value);
  }

  void addToRecentSearches(String _value) {
    _recentSearches.add(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String _value) {
    _recentSearches.remove(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
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
