class SearchResult {
  late String _word;
  late String _phonetic;
  late List<Phonetics> _phonetics;
  late String _origin;
  late List<Meanings> _meanings;

  SearchResult(
      {required String word,
      required String phonetic,
      required List<Phonetics> phonetics,
      required String origin,
      required List<Meanings> meanings}) {
    _word = word;
    _phonetic = phonetic;
    _phonetics = phonetics;
    _origin = origin;
    _meanings = meanings;
  }

  String get word => _word;
  set word(String word) => _word = word;
  String get phonetic => _phonetic;
  set phonetic(String phonetic) => _phonetic = phonetic;
  List<Phonetics> get phonetics => _phonetics;
  set phonetics(List<Phonetics> phonetics) => _phonetics = phonetics;
  String get origin => _origin;
  set origin(String origin) => _origin = origin;
  List<Meanings> get meanings => _meanings;
  set meanings(List<Meanings> meanings) => _meanings = meanings;

  SearchResult.fromJson(Map<String, dynamic> json) {
    _word = json['word'];
    
    if (json['phonetics'] != null) {
      _phonetics = <Phonetics>[];
      json['phonetics'].forEach((v) {
        _phonetics.add(Phonetics.fromJson(v));
      });
    }

    _origin = json['origin'];
    if (json['meanings'] != null) {
      _meanings = <Meanings>[];
      json['meanings'].forEach((v) {
        
        _meanings.add(Meanings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['word'] = _word;
    data['phonetic'] = _phonetic;
    if (_phonetics != null) {
      data['phonetics'] = _phonetics.map((v) => v.toJson()).toList();
    }
    data['origin'] = _origin;
    if (_meanings != null) {
      data['meanings'] = _meanings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phonetics {
  late String _text;
  late String _audio;

  Phonetics({required String text, required String audio}) {
    _text = text;
    _audio = audio;
  }

  String get text => _text;
  set text(String text) => _text = text;
  String get audio => _audio;
  set audio(String audio) => _audio = audio;

  Phonetics.fromJson(Map<String, dynamic> json) {
    if(json['text'] != null){
      _text = json['text'];
    }
    if(json['audio'] != null){
      _audio = json['audio'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = _text;
    data['audio'] = _audio;
    return data;
  }
}

class Meanings {
  late String _partOfSpeech;
  late List<Definitions> _definitions;

  Meanings({required String partOfSpeech, required List<Definitions> definitions}) {
    _partOfSpeech = partOfSpeech;
    _definitions = definitions;
  }

  String get partOfSpeech => _partOfSpeech;
  set partOfSpeech(String partOfSpeech) => _partOfSpeech = partOfSpeech;
  List<Definitions> get definitions => _definitions;
  set definitions(List<Definitions> definitions) => _definitions = definitions;

  Meanings.fromJson(Map<String, dynamic> json) {
    _partOfSpeech = json['partOfSpeech'];
    if (json['definitions'] != null) {
      _definitions = <Definitions>[];
      json['definitions'].forEach((v) {
        _definitions.add(Definitions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['partOfSpeech'] = _partOfSpeech;
    if (_definitions != null) {
      data['definitions'] = _definitions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Definitions {
  late String _definition;
  late String _example;
  late List<String> _synonyms;
  late List<String> _antonyms;

  Definitions(
      {required String definition,
      required String example,
      required List<String> synonyms,
      required List<String> antonyms}) {
    _definition = definition;
    _example = example;
    _synonyms = synonyms;
    _antonyms = antonyms;
  }

  String get definition => _definition;
  set definition(String definition) => _definition = definition;
  String get example => _example;
  set example(String example) => _example = example;
  List<String> get synonyms => _synonyms;
  set synonyms(List<String> synonyms) => _synonyms = synonyms;
  List<String> get antonyms => _antonyms;
  set antonyms(List<String> antonyms) => _antonyms = antonyms;

  Definitions.fromJson(Map<String, dynamic> json) {
    if(json['definition'] != null){
      _definition = json['definition'];
    }
    if(json['example'] != null) _example = json['example'];
    if(json['synonyms'] != null)  _synonyms = json['synonyms'].cast<String>();
    if(json['antonyms'] != null) _antonyms = json['antonyms'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['definition'] = _definition;
    data['example'] = _example;
    data['synonyms'] = _synonyms;
    data['antonyms'] = _antonyms;
    return data;
  }
}
