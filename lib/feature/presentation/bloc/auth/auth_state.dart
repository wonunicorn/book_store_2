part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState{
  const factory AuthState.status({
    AuthStatus? status,
}) =_AuthStatusState;
  const factory AuthState.loading() = _AuthLoadingState;
  const factory AuthState.error({
    String? error,
  }) = _AuthErrorState;
}