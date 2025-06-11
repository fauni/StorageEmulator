import 'dart:io';
import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginUser extends AuthEvent {
  final String email;
  final String password;

  const LoginUser({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterUser extends AuthEvent {
  final String email;
  final String password;
  final String name;
  final File image;

  const RegisterUser({
    required this.email,
    required this.password,
    required this.name,
    required this.image,
  });

  @override
  List<Object?> get props => [email, password, name, image];
}

class LoadUserProfile extends AuthEvent {}
class LogoutUser extends AuthEvent {}