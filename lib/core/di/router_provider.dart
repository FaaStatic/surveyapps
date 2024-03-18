import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:synapsissurvey/core/router/router_manager.dart';

final key = GlobalKey<NavigatorState>();

final routerProvider =
    Provider<GoRouter>((ref) => RouterManager().masterRoute(key));
