import 'package:equatable/equatable.dart';

import '../../../data/models/user.dart';

abstract class SessionState extends Equatable {}

class SessionStateLoggedIn extends SessionState {
  final User user;

  SessionStateLoggedIn(this.user);

  @override
  List<Object?> get props => [user];
}

class SessionStateLoggedOut extends SessionState {
  @override
  List<Object?> get props => [];
}
