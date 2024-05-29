

import 'package:assignment9/features/auth/data/data_source/auth_data_source.dart';
import 'package:assignment9/features/auth/data/repository/auth_repository_impl.dart';
import 'package:assignment9/features/auth/domain/repositories/auth_repository.dart';
import 'package:assignment9/features/author/data/author_data_source/author_data_source.dart';
import 'package:assignment9/features/author/data/author_repository_impl/author_repository_impl.dart';
import 'package:assignment9/features/author/domain/author_usecase/author_usecase.dart';
import 'package:assignment9/features/books/data/data_source/book_local_data_source.dart';
import 'package:assignment9/features/books/data/repository_impl/book_repository_impl.dart';
import 'package:assignment9/features/books/domain/book_usecase/book_use_case.dart';
import 'package:assignment9/features/home/data/local_data_source.dart/local_author_data_source.dart';
import 'package:assignment9/features/home/data/local_data_source.dart/local_book_data_source.dart';
import 'package:assignment9/features/home/data/repository_impl/author_repository_impl.dart';
import 'package:assignment9/features/home/data/repository_impl/book_repository_impl.dart';
import 'package:assignment9/features/home/domain/usecase/get_author_usecase.dart';
import 'package:assignment9/features/home/domain/usecase/get_books_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
final locator = GetIt.instance;

void setUp ()
{
  locator.registerSingleton<AuthorLocalDataSource>(AuthorLocalDataSource());
  locator.registerSingleton(AuthorRepositoryImpl(authorLocalDataSource:locator<AuthorLocalDataSource>() ));
locator.registerSingleton(GetAuthorUseCase(authorRepository:locator<AuthorRepositoryImpl>() ));

locator.registerSingleton(BooksLocalDataSource());
locator.registerSingleton(BookRepositoryImpl(bookFromLocal: locator<BooksLocalDataSource>()));
locator.registerSingleton(GetBookUseCase(bookRepository: locator<BookRepositoryImpl>()));

locator.registerSingleton(AuthorScreenLocalDataSource());
locator.registerSingleton(AuthorScreenRepositoryImpl(authorLocalDataSource: locator<AuthorScreenLocalDataSource>()));
locator.registerSingleton(GetAuthorScreenUseCase(authorRepository:locator<AuthorScreenRepositoryImpl>() ));


locator.registerSingleton(BooksScreenLocalDataSource());
locator.registerSingleton(BookScreenRepositoryImpl(bookFromLocal: locator<BooksScreenLocalDataSource>()));
locator.registerSingleton(GetBookScreenUseCase(bookRepository:locator<BookScreenRepositoryImpl>() ));

locator.registerSingleton(AuthDataSource());
locator.registerSingleton(AuthRepositoryImpl());

}