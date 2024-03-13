import 'package:riverpod/riverpod.dart';
import 'package:synapsissurvey/core/util/connection/network_info.dart';

final providerNetworkProvider = Provider<NetworkInfo>((ref) => NetworkInfo());
