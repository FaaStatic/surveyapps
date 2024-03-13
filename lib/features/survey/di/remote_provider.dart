import 'package:riverpod/riverpod.dart';
import 'package:synapsissurvey/features/survey/data/sources/remote_sources.dart';

final providerRemoteSources = Provider<RemoteSources>((ref) => RemoteSources());
