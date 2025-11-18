import 'package:delivery_food/core/base_classes/base_view.dart';
import 'package:delivery_food/features/login/coordinator/login_coordinator.dart';
import 'package:delivery_food/features/login/state/login_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/login_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginCoordinator, LoginViewState>(
      createViewModel: () => LoginCoordinator(),
      setupViewModel: (coordinator) {
        coordinator.initialize(context);
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
    LoginViewState state,
    LoginCoordinator coordinator,
  ) {
    return Scaffold(
      appBar: _buildAppBar(context,state.loginTitle, state.locale,(value)=> coordinator.changeLocale(value)),
      body: Padding(
              padding: EdgeInsets.all(16.w),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 480.w),
                  child: const SingleChildScrollView(child: LoginForm(
                    
                  )),
                ),
              ),
            ),
    );
  }
  _buildAppBar(context, appBarTitle, locale,Function(Locale)? onLanguageChange){
return AppBar(
        title: Text(
          appBarTitle,//state.loginTitle ?? '',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            initialValue: locale ?? const Locale('en'),
            onSelected: (value) => onLanguageChange,//coordinator.changeLocale(value),
            itemBuilder: (context) => const [
              PopupMenuItem(value: Locale('en'), child: Text('English')),
              PopupMenuItem(value: Locale('ar'), child: Text('العربية')),
              PopupMenuItem(value: Locale('es'), child: Text('Español')),
            ],
          ),
        ],
      );
  }
}