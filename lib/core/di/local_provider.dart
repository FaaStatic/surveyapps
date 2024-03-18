import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/data/sources/local/local_sources.dart';
import 'package:synapsissurvey/core/di/provider_dao.dart';

final providerLocalSources =
    Provider<LocalSources>((ref) => LocalSources(dao: ref.read(daoProvider)));
