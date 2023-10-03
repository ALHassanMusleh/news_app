abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessFailureState extends NewsStates {
  final String error;

  NewsGetBusinessFailureState({required this.error});
}

class NewsGetSportsLoadingState extends NewsStates {}

// class NewsGetSportsSuccessState extends NewsStates {
//   final List<dynamic> sports;
//
//   NewsGetSportsSuccessState({required this.sports});
// }

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsFailureState extends NewsStates {
  final String error;

  NewsGetSportsFailureState({required this.error});
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceFailureState extends NewsStates {
  final String error;

  NewsGetScienceFailureState({required this.error});
}

// class NewsChangeAppModeState extends NewsStates {}

class NewsSearchLoadingState extends NewsStates {}

class NewsSearchSuccessState extends NewsStates {}

class NewsSearchFailureState extends NewsStates {
  final String error;

  NewsSearchFailureState({required this.error});
}
