import 'package:delivery_food/core/base_classes/base_coordinator.dart';
import 'package:delivery_food/core/base_classes/ps_widgets_binding_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseView<T extends BaseCoordinator<S>, S> extends ConsumerStatefulWidget {
  const BaseView({
    super.key,
    required this.createViewModel,
    required this.setupViewModel,
    required this.builder,
  });

  final T Function() createViewModel;
  final Widget Function(BuildContext context, S state, T viewModel) builder;
  final Function(T) setupViewModel;

  @override
  BaseViewState<T, S> createState() => BaseViewState<T, S>();
}

class BaseViewState<T extends BaseCoordinator<S>, S> extends ConsumerState<BaseView<T, S>>
    with WidgetsBindingObserver {
  late T _viewModel;
  late AutoDisposeStateNotifierProvider<T, S> _myNotifierProvider;

  @override
  void initState() {
    super.initState();
    _viewModel = widget.createViewModel();
    widget.setupViewModel(_viewModel);
    _viewModel.attachRef(ref);

    _myNotifierProvider = StateNotifierProvider.autoDispose<T, S>((ref) {
      return _viewModel;
    });
    if (_viewModel is PSWidgetsBindingObserver) {
      WidgetsBinding.instance.addObserver(this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      key: Key('BaseView_Consumer'),
      builder: (context, watch, child) {
        final state = ref.watch<S>(_myNotifierProvider);
        // final viewmodel = ref.watch(_myNotifierProvider.notifier);
        return widget.builder(context, state, _viewModel);
      },
    );
  }

  @override
  void dispose() {
    if (_viewModel is PSWidgetsBindingObserver) {
      WidgetsBinding.instance.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    final listener = _viewModel as PSWidgetsBindingObserver?;
    listener?.psDidChangeAppLifecycleState(state);
  }
}
