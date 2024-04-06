import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_event.dart';
import 'package:learnify/pages/sign_in/blocs/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState>{
  SignInBloc(): super(const SignInState()){
// on<EmailEvent>((event, emit) {
//  emit(state.copyWith(email: event.email));
// });
// on<PasswordEvent>((event, emit) {
// //  emit(state.copyWith(password: event.password));
// });

// just to know where did the emit comes from
//They do the same as the above one  
on<EmailEvent>(_emailEvent);
on<PasswordEvent>(_passwordEvent);

  }
void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
  emit(state.copyWith(email: event.email));

}
void _passwordEvent(PasswordEvent event , Emitter<SignInState> emit){
  emit(state.copyWith(password: event.password));
}

}