import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/api/api_manager.dart';
import 'package:synapsissurvey/core/di/router_provider.dart';
import 'package:synapsissurvey/core/di/shared_provider.dart';

final apiProvider = Provider<Dio>((ref) =>
    ApiManager().apiSetup(ref.read(routerProvider), ref.read(providerShared)));
