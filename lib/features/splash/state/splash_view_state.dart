
class SplashViewState {
  bool? isLoading;
  bool? isRtl;
  bool hasError = false;
  String? title;
  bool? showMaintanenceScreen;

  SplashViewState({
    this.isLoading = false, 
    this.isRtl = false, 
    this.title, 
    this.hasError = false,
    this.showMaintanenceScreen,
    
  });

  SplashViewState copyWith({
    bool? isLoading,
    bool? isRtl,
    String? title,
    bool? hasError,
    bool? showMaintanenceScreen,
   
    }) {
    return SplashViewState(
      isLoading: isLoading ?? this.isLoading,
      isRtl: isRtl ?? this.isRtl,
      title: title ?? this.title,
      hasError: hasError ?? this.hasError,
      showMaintanenceScreen: showMaintanenceScreen ?? this.showMaintanenceScreen,
    );
  }
}