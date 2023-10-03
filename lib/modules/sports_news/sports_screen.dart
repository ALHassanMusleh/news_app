import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/component/widgets/custom_article_item.dart';
import 'package:news_app/shared/component/widgets/custom_divider.dart';
import 'package:news_app/shared/component/widgets/custom_error.dart';

class SportsScreen extends StatefulWidget {
  const SportsScreen({super.key});

  @override
  State<SportsScreen> createState() => _SportsScreenState();
}

class _SportsScreenState extends State<SportsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    NewsCubit.get(context).getSports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // // TODO: implement listener
        // if(state is NewsGetSportsLoadingState){
        //   print('loading state sport');
        // }
        // if(state is NewsGetSportsLoadingState){
        //   print('loading state sport');
        // }
      },
      builder: (context, state) {
        // var list = NewsCubit.get(context).sports;
        // return articleBuilder(list, context);
        if (state is NewsGetSportsLoadingState) {
          print('sports loading');
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsGetSportsSuccessState ||
            NewsCubit.get(context).sports.length > 0) {
          var list = NewsCubit.get(context).sports;
          print('sports success');
          return ListView.separated(
            // padding: BounciظظngScrollPhysics(),
            itemBuilder: (context, index) =>
                CustomArticleItem(article: list[index]),
            separatorBuilder: (context, index) => const CustomDivider(),
            itemCount: list.length,
          );
        } else if (state is NewsGetSportsFailureState) {
          print('sports fail');
          return const CustomFail();
        } else {
          print('sports other');
          return Center(
            child: Text('initial State'),
          );
        }
      },
    );
  }
}
