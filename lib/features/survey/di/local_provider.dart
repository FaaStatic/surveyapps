import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/data/sources/local_sources.dart';

final providerLocalSources = Provider<LocalSources>((ref) => LocalSources());
