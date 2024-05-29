class LanguageModel {
  final String language;
  final String sublanguage;
  final String languageCode;

  LanguageModel({required this.language, required this.sublanguage, required this.languageCode});
}


 List<LanguageModel> languageModel = [

  LanguageModel(language: 'عربي', sublanguage: 'Arabic', languageCode: 'ar'),
  LanguageModel(language: 'English', sublanguage: 'English', languageCode: 'en'),
  LanguageModel(language: 'मराठी', sublanguage: 'Marathi', languageCode: 'mr'),
  LanguageModel(language: 'हिंदी', sublanguage: 'Hindi', languageCode: 'hi'),
 ];