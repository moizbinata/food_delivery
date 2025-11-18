import 'package:delivery_food/features/splash/state/splash_view_state.dart';
import 'package:flutter/widgets.dart';
import 'package:delivery_food/core/navigation/app_routes.dart';
import 'package:delivery_food/app/router.dart';

import '../../../core/base_classes/base_coordinator.dart';

class SplashCoordinator extends BaseCoordinator<SplashViewState> {
  SplashCoordinator():super(SplashViewState(
             showMaintanenceScreen: false,
             isLoading: false,
            ));
           void initialize(){
            state = state.copyWith(isLoading: true,title: 'Moiz');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Future.delayed(const Duration(milliseconds: 1500), () {
                appRouter?.go(AppRoutes.login);
              });
            });
           }
}