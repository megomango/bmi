// import 'package:app/layout/shop_app/cubit/cubit.dart';
// import 'package:app/modules/shop_app/on_boarding/on_boarding_screen.dart';
// import 'package:app/shared/bloc_observer.dart';
// import 'package:app/shared/cubit/cubit.dart';
// import 'package:app/shared/cubit/states.dart';
// import 'package:app/shared/network/local/cache_helper.dart';
// import 'package:app/shared/network/remote/dio_helper.dart';
// import 'package:app/shared/styles/themes.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'modules/bmi_app/bmi_calculator.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import '../../app/lib/layout/news_app/cubit/cubit.dart';
// // import '../../app/lib/layout/shop_app/shop_layout.dart';
// // import '../../app/lib/modules/shop_app/login/shop_login_screen.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   await CacheHelper.init();
//   bool isDark = CacheHelper.getData(key: 'isDark');
//   Widget widget;
//   bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
//   String token = CacheHelper.getData(key: 'token');
//   if (kDebugMode) {
//     print(token);
//   }
//   if (onBoarding != null) {
//     if (token != null) {
//       widget = ShopLayout();
//     } else {
//       widget = ShopLoginScreen();
//     }
//   } else {
//     widget = OnBoardingScreen();
//   }
//   runApp(MyApp(
//     isDark,
//     widget,
//   ));
// }
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}
  // final bool isDark;
  // final Widget startWidget;
  // const MyApp(this.isDark, this.startWidget, {super.key});

  // Widget build(BuildContext context) {
  //   return MultiBlocProvider(
  //     providers: [
  //       BlocProvider(
  //         create: (context) => NewsCubit()
  //           ..getBusiness()
  //           ..getSports()
  //           ..getScience(),
  //       ),
  //       BlocProvider(
  //         create: (context) => AppCubit()
  //           ..changeThemeMode(
  //             fromShared: isDark,
  //           ),
  //       ),
  //       BlocProvider(
  //         create: (context) => ShopCubit()
  //           ..getHomeData()
  //           ..getCategoryData()
  //           ..getFavorites()
  //           ..getUserData(),
  //       ),
  //     ],
  //     child: BlocConsumer<AppCubit, AppStates>(
  //       listener: (context, state) {},
  //       builder: (context, state) {
  //         return MaterialApp(
  //             debugShowCheckedModeBanner: false,
  //             theme: lightMode,
  //             darkTheme: darkMode,
  //             themeMode: AppCubit.get(context).isDark
  //                 ? ThemeMode.dark
  //                 : ThemeMode.light,
  //             home: startWidget);
  //       },
  //     ),
  //   );
  // }