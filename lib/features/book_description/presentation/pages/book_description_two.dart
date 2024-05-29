import 'package:assignment9/features/books/domain/book_entity/book_screen_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDescriptionScreenTwo extends StatelessWidget {
 final List<BooksScreenEntity> bookList;
 final int index;
   const BookDescriptionScreenTwo({super.key, required this.bookList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(bookList[index].bookName,style: GoogleFonts.heebo(fontSize:20 , fontWeight : FontWeight.w400),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(bookList[index].bookDescription),
            ],
          )
        ],
      ),
    );
  }
}