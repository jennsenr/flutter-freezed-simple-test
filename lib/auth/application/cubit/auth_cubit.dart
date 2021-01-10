import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:prueba/auth/domain/auth_repository.dart';
import 'package:prueba/auth/domain/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthState.initial());

  Future<void> login(
      {@required String email, @required String password}) async {
    final loadingState = state.copyWith(
      isLoading: true,
    );

    emit(loadingState);

    final user = await _authRepository.login(
      email: email,
      password: password,
    );

    final newState = state.copyWith(
      isLoading: false,
      user: user,
    );

    emit(newState);
  }
}
