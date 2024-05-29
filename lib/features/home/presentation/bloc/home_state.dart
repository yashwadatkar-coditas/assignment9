import 'package:assignment9/features/home/data/model/author_model.dart';
import 'package:assignment9/features/home/domain/entity/books_entity.dart';

import '../../domain/entity/author_entity.dart';

sealed class HomeState {}

class HomeInitialState extends HomeState{

  final List<AuthorEntity> authorList;
  final List<BooksEntity> booksList;

  HomeInitialState( {required this.authorList,required this.booksList,});
}
class HomeDataLoadingState extends HomeState{}
class HomeNavigateToAuthorScreenState extends HomeState{
  final List<AuthorEntity> authorList;
  final int index;

  HomeNavigateToAuthorScreenState({required this.authorList,required this.index});
}
class HomeNavigateToBooksScreenState extends HomeState{
   final List<BooksEntity> bookList;
  final int index;

  HomeNavigateToBooksScreenState({required this.bookList, required this.index});
}