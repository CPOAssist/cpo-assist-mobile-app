import 'package:cpo_assists/modules/commissioning/bindings/commissioning_controller_binding.dart';
import 'package:cpo_assists/modules/commissioning/views/commissioning_screen.dart';
import 'package:cpo_assists/modules/general/views/splash_screen.dart';
import 'package:cpo_assists/modules/home/views/home_screen.dart';
import 'package:cpo_assists/modules/installation/bindings/installation_controller_binding.dart';
import 'package:cpo_assists/modules/installation/views/installation_screen.dart';
import 'package:cpo_assists/modules/landing/views/landing_screen.dart';
import 'package:cpo_assists/modules/login/bindings/login_controller_binding.dart';
import 'package:cpo_assists/modules/login/views/change_password.dart';
import 'package:cpo_assists/modules/login/views/forgot_password.dart';
import 'package:cpo_assists/modules/login/views/login_screen.dart';
import 'package:cpo_assists/modules/login/views/password_reset_message.dart';
import 'package:cpo_assists/modules/login/views/password_success_change.dart';
import 'package:cpo_assists/modules/profile/bindings/profile_controller_binding.dart';
import 'package:cpo_assists/modules/profile/views/profile_screen.dart';
import 'package:cpo_assists/modules/settings/views/settings_screen.dart';
import 'package:cpo_assists/modules/site_survey/bindings/site_survey_controller_binding.dart';
import 'package:cpo_assists/modules/site_survey/views/site_survey_main_screen.dart';
import 'package:cpo_assists/modules/site_survey/views/site_survey_screen.dart';
import 'package:cpo_assists/modules/support_tickets/bindings/support_ticket_controller_binding.dart';
import 'package:cpo_assists/modules/support_tickets/views/support_ticket_raising_one.dart';
import 'package:cpo_assists/modules/support_tickets/views/support_ticket_raising_two.dart';
import 'package:cpo_assists/modules/support_tickets/views/support_ticket_screen.dart';
import 'package:cpo_assists/modules/support_tickets/views/ticket_closed.dart';
import 'package:cpo_assists/modules/support_tickets/views/ticket_escalation_request_submitted.dart';
import 'package:cpo_assists/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.root, page: () => const SplashScreen()),
    GetPage(name: AppRoutes.loginScreen, page: () => const LoginScreen(), binding: LoginControllerBinding()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPassword()),
    GetPage(name: AppRoutes.resetPasswordLink, page: () => const PasswordResetMessage()),
    GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen(), binding: ProfileControllerBinding()),
    GetPage(name: AppRoutes.landingPage, page: () => const LandingScreen()),
    GetPage(name: AppRoutes.changePassword, page: () => const ChangePassword(), binding: LoginControllerBinding()),
    GetPage(name: AppRoutes.passwordSuccessChange, page: () => const PasswordSuccessChange()),
    GetPage(name: AppRoutes.homeScreen, page: () => const HomeScreen()),
    GetPage(
        name: AppRoutes.siteSurveyForm,
        page: () => const SiteSurveyFormScreen(),
        binding: SiteSurveyControllerBinding()),
    GetPage(
        name: AppRoutes.siteSurveyList,
        page: () => const SiteSurveyScreen(),
        binding: SiteSurveyControllerBinding()),
    GetPage(
        name: AppRoutes.supportTicket,
        page: () => const SupportTicketScreen(),
        binding: SupportTicketControllerBinding()),
    GetPage(
        name: AppRoutes.commissioning,
        page: () => const CommissioningScreen(),
        binding: CommissioningControllerBinding()),
    GetPage(
        name: AppRoutes.installation,
        page: () => const InstallationScreen(),
        binding: InstallationControllerBinding()),
    GetPage(
        name: AppRoutes.supportTicketFormOne,
        page: () => const SupportTicketRaisingFormOne(),
        binding: SupportTicketControllerBinding()),
    GetPage(
        name: AppRoutes.supportTicketFormTwo,
        page: () => const SupportTicketRaisingFormTwo(),
        binding: SupportTicketControllerBinding()),
    GetPage(name: AppRoutes.ticketEscalation, page: () => const TicketEscalationRequestSubmitted()),
    GetPage(name: AppRoutes.ticketClosed, page: () => const TicketClosed()),
    GetPage(name: AppRoutes.settings, page: () => const SettingsScreen()),
  ];
}
