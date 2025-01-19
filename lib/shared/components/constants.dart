
// POST
// UPDATE
// DELETE

// GET

// base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=470de1eb26774daa8c2adc94d9aca773
//https://newsapi.org/v2/top-headlines?country=eg&category=entertainment&apiKey=470de1eb26774daa8c2adc94d9aca773


//https://newsapi.org/v2/everything?q=tesla&from=2024-09-27&sortBy=publishedAt&apiKey=470de1eb26774daa8c2adc94d9aca773

// import '../../modules/shop_app/login/shop_login_screen.dart';
// import '../network/local/cache_helper.dart';
// import 'components.dart';

// void signOut(context){
//   CacheHelper.clearData(key: 'token').then((value){
//     if (value) {
//       navigateAndFinish(
//         // context,
//         // ShopLoginScreen(),
//       );
//     }
// });
// }
void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

String token = '';