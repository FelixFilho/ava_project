import 'package:ava_project/address/address_screen.dart';
import 'package:ava_project/address/register_address_screen.dart';

import 'login/login_screen.dart';
import 'signup/signup_screen.dart';

var appRoutes = {
  '/': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/address': (context) => const AddressScreen(),
  '/register-address': (context) => const RegisterAddressScreen(),
};
