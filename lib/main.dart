import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_last/bloc.dart';
import 'package:flutter_last/cahce_helper.dart';
import 'package:flutter_last/dio_service.dart';
import 'package:flutter_last/login_screen.dart';
import 'package:flutter_last/states.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            bool Dark = CacheHelper.getBool('isDark') ?? false;
            return MaterialApp(
              locale: AppCubit().get(context).locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              themeMode: Dark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: ThemeData(scaffoldBackgroundColor: Colors.grey),
              home: LoginScreen(),
              debugShowCheckedModeBanner: false,
            );
          }),
    );
  }
}
