part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoadingState extends SignupState {}
class SignupSuccessState extends SignupState {
 final UserModel? signupModel;
  SignupSuccessState({this.signupModel});
}
class SignupErrorState extends SignupState {
  final String? message;
  SignupErrorState({this.message});

}
