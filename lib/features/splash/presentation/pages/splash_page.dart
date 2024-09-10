import 'package:flutter/material.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/auth_providers.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/state/auth_state.dart';
import 'package:flutter_arms/routes/router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashState();

}


class _SplashState extends ConsumerState<SplashPage>{

  @override
  void initState() {
    EasyLoading.show();
    super.initState();
  }

  @override
  void dispose() {
    EasyLoading.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),() async {
      var state = ref.read(authStateNotifierProvider);
      if(state is Authenticated){
        router.go(AppRoutes.home);
      }
      else{
        router.go(AppRoutes.login);
      }
    });

    return Scaffold(
      body: SafeArea(child: Text("splash")),
    );
  }
  
}
