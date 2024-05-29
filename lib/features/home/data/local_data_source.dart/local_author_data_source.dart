import 'package:assignment9/features/home/data/model/author_model.dart';

class AuthorLocalDataSource {
  Future<List<AuthorModel>> getAuthorDataFromLocal() async {
    // Simulate an API call with a delay
    await Future.delayed(Duration(seconds: 2));

    // Create a list of AuthorModel objects
    final List<AuthorModel> authorData = [
      AuthorModel(authorName: 'Author 1', authorDescription: 'Description 1'),
      AuthorModel(authorName: 'Author 2', authorDescription: 'Description 2'),
      AuthorModel(authorName: 'Author 3', authorDescription: 'Description 3'),
      AuthorModel(authorName: 'Author 4', authorDescription: 'Description 4'),
      // Add more authors as needed
    ];

    // Return the list of author data
    return authorData;
  }
}