import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomArticleItem extends StatelessWidget {
  const CustomArticleItem({super.key, required this.article});

  final Map article;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppStates>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            final WebViewController controller;
            controller = WebViewController()
              ..loadRequest(
                Uri.parse(article['url']),
              );
            print('webview');
            naviagateTo(context, WebViewScreen(controller: controller));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                article['urlToImage'] == null
                    ? SizedBox()
                    : Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                          image: DecorationImage(
                            image: NetworkImage('${article['urlToImage']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${article['title']}',

                            // style: Theme.of(context).textTheme.bodyText1,

                            style: Theme.of(context).textTheme.displayMedium,

                            maxLines: 3,

                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '${DateFormat.yMd().format(DateTime.parse(article['publishedAt']))}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    ;
  }
}
