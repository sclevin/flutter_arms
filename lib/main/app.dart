import 'package:flutter/material.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/auth_providers.dart';
import 'package:flutter_arms/features/authentication/presentaion/providers/state/auth_state.dart';
import 'package:flutter_arms/routes/router.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    ref.listen(authStateNotifierProvider.select((value) => value),(previous,next){
      if(next is Authenticated){
        router.go(AppRoutes.home);
      }
      else if(next is UnAuthenticated){
        router.go(AppRoutes.login);
      }
      else{
       debugPrint("auth unknown");
      }
    });

    return MaterialApp.router(
      builder: EasyLoading.init(),
      routerConfig: router,
    );
  }
}
