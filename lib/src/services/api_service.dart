import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/suggestion_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService {
  Future<SuggestionModel> getSuggestion() async {
    try {
      final response = await Dio().get('https://www.boredapi.com/api/activity');

      return SuggestionModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Error getting suggestion: $e');
    }
  }
}
