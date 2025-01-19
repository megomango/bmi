import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final int result;
   final bool ismale;
    final int Age;
   BmiResultScreen({
     required this.result,
     required this.ismale,
     required this.Age,
});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon : Icon(
              Icons.keyboard_arrow_left
          ),
        ),
        title: Text(
          'BMI Result',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${ismale ? 'male' : 'female'}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'age : $Age',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Result : ${result.round()}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
