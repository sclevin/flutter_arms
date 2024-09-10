import 'package:flutter/material.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      body: SafeArea(child: TextButton(onPressed: (){
        ref.read(authStateNotifierProvider.notifier).logout();
      }, child: Text("home"))),
    );
  }
}
