import 'package:assignment9/features/books/data/model/book_model.dart';

class BooksScreenLocalDataSource {
  Future<List<BooksScreenModel>> getBooksDataFromLocal() async {
    // Simulate an API call with a delay
   

    // Create a list of AuthorModel objects
    final List<BooksScreenModel> bookData = [
      BooksScreenModel(bookName: 'Book 1', bookDescription: ' Book Description 1'),
      BooksScreenModel(bookName: 'Book 2', bookDescription: ' Book Description 2'),
      BooksScreenModel(bookName: 'Book 3', bookDescription: ' Book Description 3'),
      BooksScreenModel(bookName: 'Book 4', bookDescription: ' Book Description 4'),
     
      // Add more authors as needed
    ];

    // Return the list of author data
    return bookData;
  }
}