import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../services/firebase_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseService firebaseService;

  AuthBloc(this.firebaseService) : super(AuthInitial()) {
    on<LoginUser>(_onLoginUser);
    on<RegisterUser>(_onRegisterUser);
    on<LoadUserProfile>(_onLoadUserProfile);
    on<LogoutUser>(_onLogoutUser);
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await firebaseService.loginUser(
        email: event.email,
        password: event.password,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
  Future<void> _onRegisterUser(RegisterUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await firebaseService.registerUser(
        email: event.email,
        password: event.password,
        name: event.name,
        image: event.image,
      );
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLoadUserProfile(LoadUserProfile event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final data = await firebaseService.getUserProfile();
      emit(UserProfileLoaded(
        name: data['name'] ?? '',
        email: data['email'] ?? '',
        imageUrl: data['imageUrl'] ?? '',
      ));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    await firebaseService.logout();
    emit(AuthInitial());
  }

}
