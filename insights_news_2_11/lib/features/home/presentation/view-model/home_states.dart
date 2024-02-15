import 'package:insights_news_2_11/features/home/data/news_model/news_model.dart';

class NewsStates {}

class NewsInitState extends NewsStates {}
// getByCategory

class NewsByCategoryLoadingState extends NewsStates {}

class NewsByCategorySuccessState extends NewsStates {
  final NewsModel model;
  NewsByCategorySuccessState({required this.model});
}

class NewsByCategoryErrorState extends NewsStates {
  final String error;
  NewsByCategoryErrorState({required this.error});
}

// getByCategory

class NewsBySearchLoadingState extends NewsStates {}

class NewsBySearchSuccessState extends NewsStates {
  final NewsModel model;
  NewsBySearchSuccessState({required this.model});
}

class NewsBySearchErrorState extends NewsStates {
  final String error;
  NewsBySearchErrorState({required this.error});
}
