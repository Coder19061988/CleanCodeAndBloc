abstract class SkuState {}

class SkuInitial extends SkuState {}

class SkuLoading extends SkuState {}

class SkuLoaded extends SkuState {
  final int count;

  SkuLoaded({required this.count});
}

class SkuError extends SkuState {
  final String message;

  SkuError({required this.message});
}