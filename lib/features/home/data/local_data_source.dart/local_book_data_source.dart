
import 'package:assignment9/features/home/data/model/books_model.dart';

class BooksLocalDataSource {
  Future<List<BooksModel>> getBooksDataFromLocal() async {
    // Simulate an API call with a delay
    await Future.delayed(Duration(seconds: 2));

    // Create a list of AuthorModel objects
    final List<BooksModel> bookData = [
      BooksModel(bookName: 'Book 1', bookDescription: ' Book Description 1'),
      BooksModel(bookName: 'Book 2', bookDescription: ' Book Description 2'),
      BooksModel(bookName: 'Book 3', bookDescription: ' Book Description 3'),
      BooksModel(bookName: 'Book 4', bookDescription: ' Book Description 4'),
     
      // Add more authors as needed
    ];

    // Return the list of author data
    return bookData;
  }
}