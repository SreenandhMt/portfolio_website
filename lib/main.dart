import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_website/main_page/main_page.dart';
import 'package:portfolio_website/project_details/project_details_module.dart';
import 'package:portfolio_website/project_details/project_details_page.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'Project-Details/:index',
          builder: (BuildContext context, GoRouterState state) {
            final index = int.tryParse(state.pathParameters["index"].toString());
            if(index==null)
            {
              context.go("/");
            }
            return ProjectDetails(details: index);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
