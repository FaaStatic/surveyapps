import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerObsecure =
    StateNotifierProvider.autoDispose<ObsecureProvider, bool>(
        (ref) => ObsecureProvider());

class ObsecureProvider extends StateNotifier<bool> {
  ObsecureProvider() : super(false);

  void changeObsecures() {
    state = !state;
  }
}
