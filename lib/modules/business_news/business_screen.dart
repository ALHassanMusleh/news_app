import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/component/widgets/custom_article_item.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/component/widgets/custom_divider.dart';
import 'package:news_app/shared/component/widgets/custom_error.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // return articleBuilder(list, context);

        if (state is NewsGetBusinessLoadingState) {
          print('business loading');
          return Center(child: CircularProgressIndicator());
        } else if (state is NewsGetBusinessSuccessState ||
            NewsCubit.get(context).business.length > 0) {
          print('business success');
          var list = NewsCubit.get(context).business;
          return ListView.separated(
            // padding: BounciظظngScrollPhysics(),
            itemBuilder: (context, index) =>
                CustomArticleItem(article: list[index]),
            separatorBuilder: (context, index) => const CustomDivider(),
            itemCount: list.length,
          );
        } else if (state is NewsGetBusinessFailureState) {
          print('business fail');
          return const CustomFail();
        } else {
          print('business other');
          return Center(
            child: Text('initial State'),
          );
        }

        // return ConditionalBuilder(
        //   condition: state is! NewsGetBusinessLoadingState,
        //   builder: (context) => state is NewsGetBusinessSuccessState
        //       ? ListView.separated(
        //           //     // padding: BounciظظngScrollPhysics(),
        //           itemBuilder: (context, index) =>
        //               CustomArticleItem(article: list[index]),
        //           separatorBuilder: (context, index) => const CustomDivider(),
        //           itemCount: list.length,
        //         )
        //       : CustomFail(),
        //   fallback: (context) => Center(child: CircularProgressIndicator()),
        // );
      },
    );
  }
}
