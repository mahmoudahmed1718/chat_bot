import 'package:app_features/app_features.dart';
import 'package:chat_bot/features/splash/pages/on_boarding_page.dart';
import 'bloc/splash_bloc.dart';
import '../../config/app_config.dart';
import 'splash_page.dart';

class SplashFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => SplashBloc())};
  @override
  String get name => '/';
  String get onBoarding => '/onBoarding';
  static SplashFeature get to => AppFeatures.get();

  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const SplashPage()),
    GoRoute(
      path: onBoarding,
      name: onBoarding,
      builder: (_, state) => const OnBoardingPage(),
    ),
  ];
  void goToOnBoarding() => pushReplacement(name: onBoarding);
}
