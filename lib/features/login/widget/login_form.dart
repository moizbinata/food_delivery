import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:delivery_food/l10n/app_localizations.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({super.key});

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'demo@example.com');
  final _passwordController = TextEditingController(text: 'password');
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _emailFocusNode.unfocus();
    _passwordFocusNode.unfocus();

    try {
      // await ref.read(authControllerProvider.notifier).login(
      //       email: _emailController.text.trim(),
      //       password: _passwordController.text,
      //     );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString()),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    // final authState = ref.watch(authControllerProvider);
    final isLoading =false;

    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            enabled: !isLoading,
            decoration: InputDecoration(
              labelText: t.emailLabel,
              hintText: 'example@email.com',
              prefixIcon: const Icon(Icons.email_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            validator: _validateEmail,
            onFieldSubmitted: (_) {
              _passwordFocusNode.requestFocus();
            },
          ),
          SizedBox(height: 16.h),
          TextFormField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            obscureText: true,
            textInputAction: TextInputAction.done,
            enabled: !isLoading,
            decoration: InputDecoration(
              labelText: t.passwordLabel,
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.lock_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            validator: _validatePassword,
            onFieldSubmitted: (_) => _submit(),
          ),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (1==1) ? null : _submit,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: (1==1)
                  ? SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    )
                  : Text(
                      t.signIn,
                      style: TextStyle(fontSize: 16.sp),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}

