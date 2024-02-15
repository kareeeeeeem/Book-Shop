

 class AuthState {}


final class AuthInitial extends AuthState {}


class LoginSuccessState extends AuthState {}

class LoginErrorState extends AuthState {
 final String errorMassage;
  LoginErrorState({
    required this.errorMassage,
  });
}

class LoginLoadingState extends AuthState {}

class FormLoginVlidate extends AuthState {}

class FormLoginNotVlidate extends AuthState {}


class RegisterSuccessState extends AuthState {}

class RegisterErrorState extends AuthState {
 final String errorMassage;
  RegisterErrorState({
    required this.errorMassage,
  });
}

class RegisterLoadingState extends AuthState {}
class FormVlidateRegsister extends AuthState {}

class FormNotVlidateRegister extends AuthState {}
