part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState({
    bool isLoading,
    User user,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
        isLoading: false,
        user: null,
      );
}
