import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerRememberMeState =
    StateNotifierProvider.autoDispose<RememberMeStateProvider, bool>(
        (ref) => RememberMeStateProvider());

class RememberMeStateProvider extends StateNotifier<bool> {
  RememberMeStateProvider() : super(false);

  void changeRemember() {
    state = !state;
  }
}
