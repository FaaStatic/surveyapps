abstract class ErrorFetch {
  final String errorMessage;
  final int status;
  final dynamic dataError;
  const ErrorFetch(
      {required this.status,
      required this.dataError,
      required this.errorMessage});
}
