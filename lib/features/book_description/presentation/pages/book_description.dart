import 'package:assignment9/features/home/domain/entity/books_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDescription extends StatelessWidget {
  final List<BooksEntity> booksList;
  final int bookIndex;
  const BookDescription({super.key, required this.booksList, required this.bookIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        centerTitle: false,
        title: Text(booksList[bookIndex].bookName,style: GoogleFonts.heebo(fontSize:20 , fontWeight : FontWeight.w400),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(booksList[bookIndex].bookDescription),
            ],
          )
        ],
      ),);
  }
}