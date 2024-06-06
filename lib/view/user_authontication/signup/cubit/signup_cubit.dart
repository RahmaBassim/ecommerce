import 'package:bloc/bloc.dart';
import 'package:e_commerce/repostory/repostory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/response/signup_response/signup_response.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.repository}) : super(SignupInitial());
  Repository repository;
  UserModel? signupResponse;
 static SignupCubit get(context) => BlocProvider.of(context);
  saveUser({required UserModel signup}) async {

    final saveUserOrFail = await repository.saveUSer(request: signup);
    saveUserOrFail.fold(
        (failure) => emit(SignupErrorState(message: failure.message)),
    (success)  {
          signupResponse = success;
          emit(SignupSuccessState(signupModel: signupResponse));
    });
  }
  signUp({required UserModel signup}) async {
    emit(SignupLoadingState());
    final saveUserOrFail = await repository.signup(request: signup);
    saveUserOrFail.fold(
            (failure) => emit(SignupErrorState(message: failure.message)),
            (success)  async{
        await  saveUser(signup: signup);
        });
  }
}
