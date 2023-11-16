import 'dart:math';

import 'package:flutter/material.dart';

import '../models/mlodels.dart';
import '../service/service.dart';


class DataClass extends ChangeNotifier {
  //final _service = DataService();
  List<DataModel> _data = [];
  List<DataModel> get data => _data;

  DataService _apiService = DataService();

  Future<void> fetchData() async {
    try {
      _data = await _apiService.getAll();
      notifyListeners();
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }

  }
