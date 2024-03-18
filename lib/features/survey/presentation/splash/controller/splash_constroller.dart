import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapsissurvey/core/di/repository_provider.dart';
import 'package:synapsissurvey/core/di/router_provider.dart';

final splashProvider = FutureProvider<void>((ref) async {
  var repo = ref.read(repoProvider);
  var router = ref.read(routerProvider);
  var data = await repo.getUserRememberMe();
  data.fold((l) {
    Future.delayed(const Duration(milliseconds: 3000), () {
      router.go("/login");
    });
  }, (r) async {
    await repo.loginUser(name: r["user"], pass: r["pass"]).whenComplete(() {
      Future.delayed(const Duration(milliseconds: 3000), () {
        router.go("/home");
      });
    });
  });
});
