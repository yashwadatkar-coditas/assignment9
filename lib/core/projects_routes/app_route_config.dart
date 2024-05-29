

import 'package:assignment9/core/widgets/scaffold_navbar.dart';
import 'package:assignment9/features/auth/presentation/pages/login_page.dart';
import 'package:assignment9/features/auth/presentation/pages/signup_page.dart';
import 'package:assignment9/features/author/presentation/pages/author_screen.dart';
import 'package:assignment9/features/author_description/presentation/pages/author_description.dart';
import 'package:assignment9/features/author_description/presentation/pages/author_description_page_two.dart';
import 'package:assignment9/features/book_description/presentation/pages/book_description.dart';
import 'package:assignment9/features/book_description/presentation/pages/book_description_two.dart';
import 'package:assignment9/features/books/presentation/pages/books_screen.dart';

import 'package:assignment9/features/home/presentation/pages/home.dart';
import 'package:assignment9/features/intro_screens/presentation/pages/intro_screen_one.dart';
import 'package:assignment9/features/intro_screens/presentation/pages/intro_screen_three.dart';
import 'package:assignment9/features/intro_screens/presentation/pages/intro_screen_two.dart';
import 'package:assignment9/features/settings/presentation/pages/setting.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRoutes {
  
  GoRouter router = GoRouter(
      initialLocation: '/home',
      errorPageBuilder: (context, state) {
        return const MaterialPage(
          child: Scaffold(
            body: Center(
              child: Text('Page not found!'),
            ),
          ),
        );
      },
      routes: [
        GoRoute(
          name: 'intro_screen_one',
          path: '/intro_screen_one',
          pageBuilder: (context, state) {
            return const MaterialPage(child: IntroScreenOne());
          },
          
        ),
        GoRoute(
          name: 'intro_screen_two',
          path: '/intro_screen_two',
          pageBuilder: (context, state) {
            return const MaterialPage(child: IntroScreenTwo());
          },
        ),
        GoRoute(
          name: 'intro_screen_three',
          path: '/intro_screen_three',
          pageBuilder: (context, state) {
            return const MaterialPage(child: IntroScreenThree());
          },
        ),
        GoRoute(
            name: 'login',
            path: '/login',
            pageBuilder: (context, state) {
              return  MaterialPage(
                child: LoginPage(),
              );
            },
            routes: [
              GoRoute(
                name: 'signup',
                path: 'signup',
                pageBuilder: (context, state) =>
                      MaterialPage(child: SignUpPage()),
              ),
            ],),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNavBar(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/home',
                pageBuilder: (context, state) {
                  return const MaterialPage(child: Home());
                },
                routes: [
                  GoRoute(
                    name: 'authordesc',
                    path: 'authordesc',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                    // final List<AuthorEntity> authList = state.extra as List<AuthorEntity>; 
                    // int index = state.extra as int ;
                    // final List<AuthorEntity> authList = state.pathParameters['authList'] as List<AuthorEntity>;
                    // int authIndex = state.extra as int ;
                    final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>;
                    
                    return MaterialPage(
                          child: AuthorDescription(
                            authorList: mp['authList'],
                            index: mp['authIndex'],
                          ),);
                    },
                  ),

                  GoRoute(path: 'bookdesc',
                  pageBuilder: (context, state) {
                    final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>; 

                    return MaterialPage(child: BookDescription(booksList: mp['bookList'], bookIndex:mp['bookIndex'] ));
                  },
                  ),
                ],
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/author',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: AuthorScreen()),
                       routes: [
                  GoRoute(
                    
                    path: 'authordesctwo',
                    pageBuilder: (BuildContext context, GoRouterState state) {
                    // final List<AuthorEntity> authList = state.extra as List<AuthorEntity>; 
                    // int index = state.extra as int ;
                    // final List<AuthorEntity> authList = state.pathParameters['authList'] as List<AuthorEntity>;
                    // int authIndex = state.extra as int ;
                    final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>;
                    
                      return MaterialPage(
                          child: AuthorDescriptionScreenTwo(
                            authorList: mp['authorList'],
                            index: mp['authorIndex'],
                          ),);
                    },
                  ),],
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/books',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: BooksScreen()),

                    routes: [
                       GoRoute(path: 'bookdesc',
                  pageBuilder: (context, state) {
                    final Map<String,dynamic> mp = state.extra! as Map<String,dynamic>;

                    return MaterialPage(child: BookDescriptionScreenTwo(bookList: mp['bookList'], index:mp['bookIndex'] ));
                  },
                  ),
                    ],
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: '/setting',
                pageBuilder: (context, state) =>
                    const MaterialPage(child: SettingScreen()),
              ),
            ]),
          ],
        ),
      ],);
}
