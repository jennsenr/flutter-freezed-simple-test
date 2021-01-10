import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:prueba/auth/application/cubit/auth_cubit.dart';
import 'package:prueba/auth/domain/auth_repository.dart';

class MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  final mockAuthRepository = MockAuthRepository();

  blocTest(
    'AuthCubit login',
    build: () {
      when(mockAuthRepository.login(
              email: anyNamed('email'), password: anyNamed('password')))
          .thenAnswer((_) async => null);
      return AuthCubit(mockAuthRepository);
    },
    act: (AuthCubit cubit) => cubit.login(email: '', password: ''),
    expect: [
      AuthState().copyWith(
        isLoading: true,
      ),
      AuthState().copyWith(
        isLoading: false,
      )
    ],
  );
}
