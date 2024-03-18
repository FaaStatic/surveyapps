import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

final biometricProvider =
    Provider<LocalAuthentication>((ref) => LocalAuthentication());
