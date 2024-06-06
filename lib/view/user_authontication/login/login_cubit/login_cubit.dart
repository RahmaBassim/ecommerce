import 'package:bloc/bloc.dart';
import 'package:e_commerce/models/request/login_request/login_request.dart';
import 'package:e_commerce/repostory/repostory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.repository}) : super(LoginInitial());
  Repository repository;
 static LoginCubit get(context)=>BlocProvider.of(context);
  login({required LoginRequestModel request})async{
    emit(LoginLoading());
   final loginOrFailure=await  repository.login(request: request);
   loginOrFailure.fold((l) {
     emit(LoginErrorState(error: l.message??''));
   }, (r) {

     emit(LoginSuccessState());
   },);
  }
}
