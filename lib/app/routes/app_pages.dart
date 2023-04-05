import 'package:get/get.dart';

import '../modules/chat_screen/bindings/chat_screen_binding.dart';
import '../modules/chat_screen/views/chat_screen_view.dart';
import '../modules/chats/bindings/chats_binding.dart';
import '../modules/chats/views/chats_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/stars/bindings/stars_binding.dart';
import '../modules/stars/views/stars_view.dart';
import '../modules/therapist_home/bindings/therapist_home_binding.dart';
import '../modules/therapist_home/views/therapist_home_view.dart';
import '../modules/therapist_profile/bindings/therapist_profile_binding.dart';
import '../modules/therapist_profile/views/therapist_profile_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.THERAPIST_PROFILE,
      page: () => const TherapistProfileView(),
      binding: TherapistProfileBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => const PaymentView(),
      binding: PaymentBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => const UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.STARS,
      page: () => const StarsView(),
      binding: StarsBinding(),
    ),
    GetPage(
      name: _Paths.THERAPIST_HOME,
      page: () => const TherapistHomeView(),
      binding: TherapistHomeBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_SCREEN,
      page: () => const ChatScreenView(),
      binding: ChatScreenBinding(),
    ),
    GetPage(
      name: _Paths.CHATS,
      page: () => const ChatsView(),
      binding: ChatsBinding(),
    ),
  ];
}
