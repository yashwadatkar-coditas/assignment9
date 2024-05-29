import 'package:assignment9/features/author/data/author_model/author_model.dart';

class AuthorScreenLocalDataSource {
  List<AuthorScreenModel> getAuthorDataFromLocal()  {
    // Simulate an API call with a delay
   // await Future.delayed(Duration(seconds: 2));

    // Create a list of AuthorModel objects
    final List<AuthorScreenModel> authorData = [
      AuthorScreenModel(authorName: 'Author 1', authorDescription: 'Description 1'),
      AuthorScreenModel(authorName: 'Author 2', authorDescription: 'Description 2'),
      AuthorScreenModel(authorName: 'Author 3', authorDescription: 'Description 3'),
      AuthorScreenModel(authorName: 'Author 4', authorDescription: 'Description 4'),
      // Add more authors as needed
    ];

    // Return the list of author data
    return authorData;
  }
}