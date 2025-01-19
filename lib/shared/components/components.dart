import 'package:app/shared/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// import '../../modules/news_app/web_view/web_view_screen.dart';

Widget deafultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUppercase = true,
  Function? function,
  required String text,
  required double raduis,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduis),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function!(),
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: function(),
      child: Text(text.toUpperCase()),
    );
Widget deafultTextFormFeild({
  required TextEditingController controller,
  required TextInputType type,
  bool isobscure = false,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  Function? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isobscure,
      onFieldSubmitted: onSubmit != null ? (value) => onSubmit(value) : null,
      onChanged: onChange != null ? (value) => onChange(value) : null,
      onTap: onTap != null ? () => onTap() : null,
      validator: validate != null ? (value) => validate(value) : null,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
            : null,
        border: OutlineInputBorder(),
      ),
    );

// Widget buildNewTaskScreen(Map model, context) => Dismissible(
//       key: Key(model['id'].toString()),
//       child: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Row(
//           children: [
//             CircleAvatar(
//               radius: 40,
//               child: Text('${model['time']}'),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Expanded(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     ' ${model['title']}',
//                     style: TextStyle(
//                       fontSize: 30,
//                       color: Colors.black45,
//                     ),
//                   ),
//                   Text(
//                     '${model['date']}',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.black45,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateDatabase(status: 'done', id: model['id']);
//               },
//               icon: Icon(
//                 Icons.check_box,
//                 color: Colors.green,
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 AppCubit.get(context)
//                     .updateDatabase(status: 'archive', id: model['id']);
//               },
//               icon: Icon(
//                 Icons.archive_outlined,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//       onDismissed: (direction) {
//         AppCubit.get(context).deleteDatabase(id: model['id']);
//       },
//     );

// Widget taskBuilder({
//   required List<Map> tasks,
// }) =>
//     ConditionalBuilder(
//       condition: tasks.length > 0,
//       builder: (context) => ListView.separated(
//         itemBuilder: (context, index) =>
//             buildNewTaskScreen(tasks[index], context),
//         separatorBuilder: (context, index) => Container(
//           width: double.infinity,
//           height: 1,
//           color: Colors.grey,
//         ),
//         itemCount: tasks.length,
//       ),
//       fallback: (context) => Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.menu,
//               size: 100,
//               color: Colors.grey,
//             ),
//             Text(
//               'Dont have data',
//               style: TextStyle(
//                 fontSize: 30,
//                 color: Colors.grey,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
Widget myDivider() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
// Widget buildArticleItem(article, context) => InkWell(
//       onTap: () {
//         navigateTo(context, WebViewScreen(article['url']));
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Container(
//                 width: 120,
//                 height: 120,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   image: DecorationImage(
//                     image: article['urlToImage'] != null &&
//                             article['urlToImage'].isNotEmpty
//                         ? NetworkImage(article['urlToImage'])
//                         : NetworkImage(
//                             'https://plus.unsplash.com/premium_photo-1664474619075-644dd191935f?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aW1hZ2V8ZW58MHx8MHx8fDA%3D'),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 16,
//             ),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     '${article['title']}',
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Text(
//                     '${article['publishedAt']}',
//                     style: Theme.of(context).textTheme.bodyLarge,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//       condition: list.length > 0,
//       builder: (context) => ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => myDivider(),
//         itemCount: list.length,
//       ),
//       fallback: (context) =>
//           Center(child: isSearch ? Container() : CircularProgressIndicator()),
//     );
void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );
void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}
