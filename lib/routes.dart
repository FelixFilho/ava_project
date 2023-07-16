import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

var appRoutes = {
  '/': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
};
