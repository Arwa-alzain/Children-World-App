
import 'package:educational_for_children/core/storage/shared_prefs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupState{}

class SignupIntial extends SignupState{}

class SignupSuccess extends SignupState{}

class SignupLoading extends SignupState{}

class SignupFailure extends SignupState{
  final String errorMessage;
  SignupFailure(this.errorMessage);
}


class SignupCubit extends Cubit<SignupState>{
  SignupCubit() : super(SignupIntial());

Future<void> loginWithEmailAndPassword(String email, String password, String name) async {
  emit(SignupLoading());

  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await userCredential.user!.updateDisplayName(name);

    await SharedPrefs().setString('userEmail', email);
    await SharedPrefs().setString('userName', name);

    emit(SignupSuccess());
  } on FirebaseAuthException catch (error) {
    emit(SignupFailure(error.message ?? 'error an occured.. try again'));
  }
}

}