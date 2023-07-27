import 'package:ava_project/core/cubit/session_cubit/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user.dart';

class SessionCubit extends Cubit<SessionState> {
  SessionCubit() : super(SessionStateLoggedOut());

  void signIn(User user) {
    emit(SessionStateLoggedIn(user));
  }

  void signOut() {
    emit(SessionStateLoggedOut());
  }
}
