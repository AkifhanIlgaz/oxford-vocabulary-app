enum PartOfSpeech {
  conjunction,
  preposition,
  verb,
  adjective,
  noun,
  adverb,
  indefiniteArticle,
}

enum CEFRLevel {
  a1,
  a2,
  b1,
  b2,
  c1,
  c2,
}

class Word {
  final String word;
  final String source;
  final String? audio;
  final PartOfSpeech? partOfSpeech;
  final CEFRLevel? cefrLevel;
  final List<Meaning>? meanings;

  Word({
    required this.word,
    required this.source,
    required this.audio,
    required this.partOfSpeech,
    required this.cefrLevel,
    required this.meanings,
  });
}

class Meaning {
  final String meaning;
  final List<String>? examples;

  Meaning({
    required this.meaning,
    required this.examples,
  });
}

class Idiom {
  final String usage;
  final List<Meaning>? meanings;

  Idiom({
    required this.usage,
    required this.meanings,
  });
}
