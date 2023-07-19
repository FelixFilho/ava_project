import 'package:ava_project/view/address/address_screen.dart';
import 'package:ava_project/view/address/register_address_screen.dart';

import 'view/login/login_screen.dart';
import 'view/signup/signup_screen.dart';

var appRoutes = {
  '/': (context) => const LoginScreen(),
  '/signup': (context) => const SignUpScreen(),
  '/address': (context) => const AddressScreen(),
  '/register-address': (context) => const RegisterAddressScreen(),
};
