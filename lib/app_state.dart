import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
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

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    notifyListeners();

    _searchActive = _value;
  }

  bool _timerRunning = false;
  bool get timerRunning => _timerRunning;
  set timerRunning(bool _value) {
    notifyListeners();

    _timerRunning = _value;
  }

  int _swipableListIndex = 0;
  int get swipableListIndex => _swipableListIndex;
  set swipableListIndex(int _value) {
    notifyListeners();

    _swipableListIndex = _value;
    prefs.setInt('ff_swipableListIndex', _value);
  }

  bool _searchActive2 = false;
  bool get searchActive2 => _searchActive2;
  set searchActive2(bool _value) {
    notifyListeners();

    _searchActive2 = _value;
  }

  List<String> _recentSearches = [];
  List<String> get recentSearches => _recentSearches;
  set recentSearches(List<String> _value) {
    notifyListeners();

    _recentSearches = _value;
    prefs.setStringList('ff_recentSearches', _value);
  }

  void addToRecentSearches(String _value) {
    notifyListeners();
    _recentSearches.add(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  void removeFromRecentSearches(String _value) {
    notifyListeners();
    _recentSearches.remove(_value);
    prefs.setStringList('ff_recentSearches', _recentSearches);
  }

  List<String> _jobsTypes = [
    'نجار',
    'حداد',
    'بليط',
    'دهين',
    'قصير',
    'مقاول',
    'كهربجي',
    'مواسرجي',
    'سائق',
    'ديكور',
    'صيانة',
    'تنظيف',
    'مصلح',
    'حلاق',
    'عامل',
    'مزارع',
    'مبرمج',
    'ميكانيكي',
    'الكل'
  ];
  List<String> get jobsTypes => _jobsTypes;
  set jobsTypes(List<String> _value) {
    notifyListeners();

    _jobsTypes = _value;
  }

  void addToJobsTypes(String _value) {
    notifyListeners();
    _jobsTypes.add(_value);
  }

  void removeFromJobsTypes(String _value) {
    notifyListeners();
    _jobsTypes.remove(_value);
  }

  List<String> _activeFilter = [];
  List<String> get activeFilter => _activeFilter;
  set activeFilter(List<String> _value) {
    notifyListeners();

    _activeFilter = _value;
  }

  void addToActiveFilter(String _value) {
    notifyListeners();
    _activeFilter.add(_value);
  }

  void removeFromActiveFilter(String _value) {
    notifyListeners();
    _activeFilter.remove(_value);
  }

  bool _customizeTriger = false;
  bool get customizeTriger => _customizeTriger;
  set customizeTriger(bool _value) {
    notifyListeners();

    _customizeTriger = _value;
  }

  List<String> _filterizationDefault = [];
  List<String> get filterizationDefault => _filterizationDefault;
  set filterizationDefault(List<String> _value) {
    notifyListeners();

    _filterizationDefault = _value;
  }

  void addToFilterizationDefault(String _value) {
    notifyListeners();
    _filterizationDefault.add(_value);
  }

  void removeFromFilterizationDefault(String _value) {
    notifyListeners();
    _filterizationDefault.remove(_value);
  }

  String _filterByWork = 'الكل';
  String get filterByWork => _filterByWork;
  set filterByWork(String _value) {
    notifyListeners();

    _filterByWork = _value;
  }

  String _filterByCities = 'الكل';
  String get filterByCities => _filterByCities;
  set filterByCities(String _value) {
    notifyListeners();

    _filterByCities = _value;
  }

  bool _filterByHasCar = false;
  bool get filterByHasCar => _filterByHasCar;
  set filterByHasCar(bool _value) {
    notifyListeners();

    _filterByHasCar = _value;
  }

  int _searchInitialTab = 0;
  int get searchInitialTab => _searchInitialTab;
  set searchInitialTab(int _value) {
    notifyListeners();

    _searchInitialTab = _value;
  }

  List<int> _ratings = [0, 1, 2, 3, 4, 5];
  List<int> get ratings => _ratings;
  set ratings(List<int> _value) {
    notifyListeners();

    _ratings = _value;
  }

  void addToRatings(int _value) {
    notifyListeners();
    _ratings.add(_value);
  }

  void removeFromRatings(int _value) {
    notifyListeners();
    _ratings.remove(_value);
  }

  int _filterByRating = 0;
  int get filterByRating => _filterByRating;
  set filterByRating(int _value) {
    notifyListeners();

    _filterByRating = _value;
  }

  List<String> _cities = [
    'الكل',
    'عمان',
    'الزرفاء',
    'اربد',
    'المفرق',
    'العقبة',
    'عجلون',
    'جرش',
    'الكرك',
    'معان',
    'البلقاء',
    'الطفيلة',
    'السلط'
  ];
  List<String> get cities => _cities;
  set cities(List<String> _value) {
    notifyListeners();

    _cities = _value;
  }

  void addToCities(String _value) {
    notifyListeners();
    _cities.add(_value);
  }

  void removeFromCities(String _value) {
    notifyListeners();
    _cities.remove(_value);
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
