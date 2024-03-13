import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/database/database_manager.dart';

final providerDb = Provider<DatabaseManager>((ref) => DatabaseManager());
