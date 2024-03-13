import 'package:synapsissurvey/core/util/error/error_fetch.dart';

class FetchLocalFail extends ErrorFetch {
  FetchLocalFail(
      {required super.errorMessage,
      required super.status,
      required super.dataError});
}
