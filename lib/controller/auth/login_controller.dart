
import 'package:educational_for_children/core/storage/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginState{}

class LoginIntial extends LoginState{}

class LoginSuccess extends LoginState{}

class LoginLoading extends LoginState{}

class LoginFailure extends LoginState{
  final String errorMessage;
  LoginFailure(this.errorMessage);
}


class LoginCubit extends Cubit<LoginState>{
  LoginCubit() : super(LoginIntial());

 Future<void> loginWithEmailAndPassword(String email, String password) async {
  emit(LoginLoading());

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

    await SharedPrefs().setString('userEmail', email);

    User? user = FirebaseAuth.instance.currentUser;
    if (user?.displayName != null) {
      await SharedPrefs().setString('userName', user!.displayName!);
    }

    emit(LoginSuccess());
  } on FirebaseAuthException catch (error) {
    emit(LoginFailure(error.message ?? 'error an occured.. try again'));
  }
}

}