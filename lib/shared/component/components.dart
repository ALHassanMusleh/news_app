import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web_view.dart';
import 'package:news_app/shared/component/widgets/custom_article_item.dart';
import 'package:news_app/shared/component/widgets/custom_divider.dart';
import 'package:webview_flutter/webview_flutter.dart';
//
// Widget defaultButton({
//   double width = double.infinity,
//   Color backGround = Colors.blue,
//   required String text,
//   required void Function() onPressed,
//   bool isUpper = true,
//   double radius = 0,
// }) =>
//     Container(
//       width: width,
//       decoration: BoxDecoration(
//         color: backGround,
//         borderRadius: BorderRadius.circular(
//           radius,
//         ),
//       ),
//       child: MaterialButton(
//         height: 50,
//         onPressed: onPressed,
//         // onPressed: () {
//         //   // print(emailController.text);
//         //   // print(passwordController.text);
//         //
//         // },
//         child: Text(
//           isUpper ? text.toUpperCase() : text,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 17,
//           ),
//         ),
//       ),
//     );
//
// Widget defaultTextFormField(
//   context, {
//   required TextEditingController controller,
//   required TextInputType type,
//   void Function(String)? onSubmitted,
//   void Function(String)? onChanged,
//   required String? Function(String?) validate,
//   required String label,
//   required IconData prefix,
//   IconData? suffix,
//   bool obscureText = false,
//   void Function()? onPressedIconSuffix,
// }) =>
//     TextFormField(
//       style: Theme.of(context).textTheme.displayMedium,
//       controller: controller,
//       onFieldSubmitted: onSubmitted,
//       onChanged: onChanged,
//       validator: validate,
//       obscureText: obscureText,
//       keyboardType: type,
//       decoration: InputDecoration(
//         hintText: label,
//         labelText: label,
//         labelStyle: TextStyle(
//           color: Colors.grey,
//         ),
//         hintStyle: TextStyle(
//           color: Colors.grey,
//         ),
//         border: const OutlineInputBorder(),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.grey),
//         ),
//         prefixIcon: Icon(
//           prefix,
//           color: Colors.grey,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 icon: Icon(
//                   suffix,
//                   color: Colors.grey,
//                 ),
//                 onPressed: onPressedIconSuffix,
//               )
//             : null,
//       ),
//     );

// Widget myDivider() => Padding(
//       padding: const EdgeInsetsDirectional.only(start: 20.0),
//       child: Container(
//         width: double.infinity,
//         height: 1,
//         color: Colors.grey[300],
//       ),
//     );

// Widget buildArticleItem(Map article, context) => InkWell(
//       onTap: () {
//          final WebViewController controller;
//         controller = WebViewController()
//           ..loadRequest(
//             Uri.parse(article['url']),
//           );
//         print('webview');
//         naviagateTo(context, WebViewScreen(controller: controller));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             article['urlToImage'] == null
//                 ? SizedBox()
//                 : Container(
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(
//                         10,
//                       ),
//                       image: DecorationImage(
//                         image: NetworkImage('${article['urlToImage']}'),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//             SizedBox(
//               width: 20,
//             ),
//             Expanded(
//               child: Container(
//                 height: 120,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         '${article['title']}',
//
//                         // style: Theme.of(context).textTheme.bodyText1,
//
//                         style: Theme.of(context).textTheme.displayMedium,
//
//                         maxLines: 3,
//
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Text(
//                       '${article['publishedAt']}',
//                       style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        // padding: BounciظظngScrollPhysics(),
        itemBuilder: (context, index) => CustomArticleItem(
          article: list[index],
        ),
        separatorBuilder: (context, index) => CustomDivider(),
        itemCount: list.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void naviagateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
