// ignore_for_file: public_member_api_docs, sort_constructors_first
class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language({
    required this.id,
    required this.flag,
    required this.name,
    required this.languageCode,
  });

  static List<Language> languageList() {
    return <Language>[
      Language(id: 1, flag: '🇬🇧', name: 'English', languageCode: 'en'),
      Language(id: 2, flag: '🇹🇭', name: 'ภาษาไทย', languageCode: 'th'),
    ];
  }
}
