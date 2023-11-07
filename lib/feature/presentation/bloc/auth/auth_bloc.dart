import 'package:book_app/core/utils/enums.dart';
import 'package:book_app/feature/domain/use_case/use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState>{

  final GetLoginUseCase getLoginUseCase;
  final GetRegisterUseCase getRegisterUseCase;
  final GetLogoutUseCase getLogoutUseCase;

  AuthBloc(this.getRegisterUseCase, this.getLogoutUseCase, this.getLoginUseCase)
      : super (const AuthState.status(status: AuthStatus.unknown)){
    on<AuthLoginEvent>(_onLogin);
    on<AuthRegisterEvent>(_onRegister);
    on<AuthLogoutEvent>(_onLogout);
  }

  Future<void> _onLogin(AuthLoginEvent event, Emitter<AuthState> emit) async{
    emit(const AuthState.loading());
    try{
      await getLoginUseCase.call(event.email, event.password);
      emit(const AuthState.status(status: AuthStatus.authenticated));
    }on FirebaseAuthException catch  (e) {
      emit(AuthState.error(error: e.toString()));

      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<void> _onRegister(AuthRegisterEvent event, Emitter<AuthState> emit) async{
    emit(const AuthState.loading());
    try{
      await getRegisterUseCase.call(event.email, event.password);
      emit(const AuthState.status(status: AuthStatus.authenticated));

    }on FirebaseAuthException catch  (e) {
      emit(AuthState.error(error: e.toString()));

      print('Failed with error code: ${e.code}');
      print(e.message);
    }
  }

  Future<void> _onLogout( AuthLogoutEvent event, Emitter<AuthState> emit) async{
    await getLogoutUseCase.call();
    emit(const AuthState.status(status: AuthStatus.unauthenticated));
  }
}