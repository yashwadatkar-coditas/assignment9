import 'package:assignment9/core/dependency_injection_container/dependency_injection_container.dart';
import 'package:assignment9/core/projects_routes/app_route_config.dart';
import 'package:assignment9/features/auth/presentation/bloc/auth_bloc.dart';

import 'package:assignment9/features/author/presentation/bloc/author_bloc.dart';
import 'package:assignment9/features/author/presentation/bloc/author_event.dart';


import 'package:assignment9/features/books/presentation/bloc/book_bloc.dart';
import 'package:assignment9/features/books/presentation/bloc/book_event.dart';
import 'package:assignment9/features/home/presentation/bloc/home_bloc.dart';
import 'package:assignment9/features/home/presentation/bloc/home_event.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_bloc.dart';
import 'package:assignment9/features/intro_screens/presentation/bloc/intro_event.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_bloc.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_event.dart';
import 'package:assignment9/features/settings/presentation/bloc/language_state.dart';
import 'package:assignment9/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  setUp();
  runApp( MultiBlocProvider(
    providers: [
       BlocProvider<LanguageBloc>(create: (context) => LanguageBloc()..add(LoadSavedLocalizationEvent())),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        BlocProvider<BookBloc>(
          create: (context) => BookBloc()..add(InitialBookEvent()),
        ),
        BlocProvider<AuthorBloc>(
          create: (context) => AuthorBloc()..add(InitialAuthorScreenEvent()),
        ),
        BlocProvider<IntroBloc>(
          create: (context) => IntroBloc()..add(IntroScreenInitialEvent()),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc()..add(HomeInitialEvent()),
        ),
    ],
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc,LanguageState>(
      builder: (context, state) {
        return    MaterialApp.router(
        locale: state.locale,
        routerConfig: MyAppRoutes().router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      );
      },
    
    );
  }
}