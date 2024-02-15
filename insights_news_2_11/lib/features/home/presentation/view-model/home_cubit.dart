import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news_2_11/core/services/api_services.dart';
import 'package:insights_news_2_11/features/home/presentation/view-model/home_states.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  // getByCategory
  getByCategory(String category) {
    emit(NewsByCategoryLoadingState());

    try {
      ApiServices.getNewsByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(error: e.toString()));
    }
  }

  // getByCategory
  getBySearch(String searchKey) {
    emit(NewsBySearchLoadingState());

    try {
      ApiServices.getNewsBySearch(searchKey).then((value) {
        emit(NewsBySearchSuccessState(model: value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState(error: e.toString()));
    }
  }
}
