import 'package:flutter/material.dart';
import 'package:flutter_arms/routes/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SafeArea(child: TextButton(onPressed: (){
        router.go(AppRoutes.home);
      }, child: Text("login"))),
    );
  }
}
