import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/dao/dao_db.dart';
import 'package:synapsissurvey/features/survey/di/provider_db.dart';

final daoProvider =
    Provider<DaoDB>((ref) => DaoDB(database: ref.read(dbProvider)));
