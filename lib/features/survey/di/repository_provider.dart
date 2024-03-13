import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/features/survey/data/repositories/survey_repositories.dart';
import 'package:synapsissurvey/features/survey/di/local_provider.dart';
import 'package:synapsissurvey/features/survey/di/network_provider.dart';
import 'package:synapsissurvey/features/survey/di/remote_provider.dart';
import 'package:synapsissurvey/features/survey/domain/usecase/assessment_usecase.dart';

final repoProvider = Provider<AssesmentUsecase>((ref) => AssesmentUsecase(
    SurveyRepositories(
        remoteSource: ref.read(providerRemoteSources),
        localSource: ref.read(providerLocalSources),
        info: ref.read(providerNetworkProvider))));
