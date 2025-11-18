
import 'package:delivery_food/core/base_classes/base_view.dart';
import 'package:delivery_food/features/splash/coordinator/splash_coordinator.dart';
import 'package:flutter/material.dart';

import '../state/splash_view_state.dart';

class SplashView extends StatelessWidget {
  final bool mockLogin;

  const SplashView({
    super.key,
    this.mockLogin = false,
  });

  @override
  Widget build(BuildContext context) {
   
    return BaseView<SplashCoordinator, SplashViewState>(
      createViewModel: () => SplashCoordinator(),
      setupViewModel: (coordinator) {
        coordinator.initialize();
      },
      builder: (
        context,
        state,
        coordinator,
      ) =>
          buildWithState(
        context,
        state,
        coordinator,
      ),
    );
  }

  Widget buildWithState(
    BuildContext context,
    SplashViewState state,
    SplashCoordinator coordinator,
  ) {
    // return state.isLoading ?? false ? Text('Loading') : 
    // (state.showMaintanenceScreen ?? false) ?  Text('maintenance') : state.hasError
    //       ?  Text('error')
    //     : Text('splash') ;
    return Text(state.title ?? '');
  }
}