class WordResponse {
  String? word;
  String? definition;
  String? example;

  WordResponse({
    this.word,
     this.definition,
    this.example
  });

  factory WordResponse.fromJson(Map<String, dynamic> json) => WordResponse(
        word: json["word"],
        definition: json["definition"],
        example: json["example"]
      );
}
