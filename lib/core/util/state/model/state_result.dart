class StateResult<T> {
  final T? data;
  final bool hasNextPage;

  StateResult({required this.data, this.hasNextPage = false});

  StateResult<T> copyWith({required T data, bool hasNext = false}) {
    return StateResult(data: data, hasNextPage: hasNext);
  }
}
