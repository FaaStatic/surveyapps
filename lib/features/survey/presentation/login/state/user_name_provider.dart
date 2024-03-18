import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerUsername = StateNotifierProvider<UserNameProvider, String>(
    (ref) => UserNameProvider());

class UserNameProvider extends StateNotifier<String> {
  UserNameProvider() : super("");

  void changeUserName(String data) {
    state = data;
  }
}
