import 'package:assignment9/features/author/domain/author_entity/author_entity.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorDescriptionScreenTwo extends StatelessWidget {
 final List<AuthorScreenEntity> authorList;
 final int index;
  const AuthorDescriptionScreenTwo({super.key, required this.authorList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(authorList[index].authorName,style: GoogleFonts.heebo(fontSize:20 , fontWeight : FontWeight.w400),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(authorList[index].authorDescription),
            ],
          )
        ],
      ),
    );
  }
}