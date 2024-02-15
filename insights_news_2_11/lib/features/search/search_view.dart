import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:insights_news_2_11/core/utils/app_colors.dart';
import 'package:insights_news_2_11/core/utils/text_styles.dart';
import 'package:insights_news_2_11/features/home/presentation/view-model/home_cubit.dart';
import 'package:insights_news_2_11/features/search/widgets/news_list_builder.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Find Your News',
            style: getTitleStyle(color: AppColors.white, fontSize: 17),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // search bar
              TextFormField(
                style: getBodyStyle(color: AppColors.white),
                onChanged: (value) {
                  context.read<NewsCubit>().getBySearch(value);
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    hintText: 'Search for news'),
              ),
              // search items
              const Gap(20),

              SearchListBuilder()
            ],
          ),
        ));
  }
}
