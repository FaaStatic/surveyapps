import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:riverpod/riverpod.dart';
import 'package:synapsissurvey/core/di/biomtric_provider.dart';

final biometricControllerProvider =
    StateNotifierProvider<BiometricCheckController, AsyncValue<bool>>(
        (ref) => BiometricCheckController(auth: ref.read(biometricProvider)));

class BiometricCheckController extends StateNotifier<AsyncValue<bool>> {
  final LocalAuthentication auth;
  BiometricCheckController({required this.auth})
      : super(const AsyncData(false));

  Future<void> biometeriCheck() async {
    // state = const AsyncLoading();
    var canAuth = await auth.getAvailableBiometrics();
    var supportAuth = await auth.isDeviceSupported();
    if (canAuth.isNotEmpty && supportAuth) {
      state = await AsyncValue.guard(() => Future.value(true));
    }
  }
}
