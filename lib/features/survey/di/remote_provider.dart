import 'package:riverpod/riverpod.dart';
import 'package:synapsissurvey/features/survey/data/sources/remote/remote_sources.dart';
import 'package:synapsissurvey/features/survey/di/api_Provider.dart';

final providerRemoteSources =
    Provider<RemoteSources>((ref) => RemoteSources(api: ref.read(apiProvider)));
