import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerPass = StateNotifierProvider.autoDispose<PassProvider, String>(
    (ref) => PassProvider());

class PassProvider extends StateNotifier<String> {
  PassProvider() : super("");

  void changePass(String data) {
    state = data;
  }
}
