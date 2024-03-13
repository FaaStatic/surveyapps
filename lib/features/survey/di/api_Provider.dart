import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/api/api_manager.dart';

final apiProvider = Provider<Dio>((ref) => ApiManager().apiSetup());
