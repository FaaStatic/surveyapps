import 'package:synapsissurvey/core/util/error/error_fetch.dart';

class FetchApiFail extends ErrorFetch {
  FetchApiFail(
      {required super.errorMessage,
      required super.status,
      required super.dataError});
}
