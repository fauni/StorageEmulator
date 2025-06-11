import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthFailure extends AuthState {
  final String error;

  const AuthFailure(this.error);

  @override
  List<Object?> get props => [error];
}

class UserProfileLoaded extends AuthState {
  final String name;
  final String email;
  final String imageUrl;

  const UserProfileLoaded({
    required this.name,
    required this.email,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, email, imageUrl];
}
