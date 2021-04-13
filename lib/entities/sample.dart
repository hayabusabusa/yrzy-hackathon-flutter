class Sample {
  final List<SampleElement> array;

  Sample({
    required this.array,
  });

  factory Sample.fromJson(Map<String, dynamic> json) {
    final List<dynamic> arrayJson = json['array'];
    return Sample(array: arrayJson
      .map((e) => SampleElement.fromJson(e))
      .toList()
    );
  }
}

class SampleElement {
  final int integer;
  final String string;
  final bool boolean;
  final List<String> strings;

  SampleElement({
    required this.integer,
    required this.string,
    required this.boolean,
    required this.strings,
  });

  factory SampleElement.fromJson(Map<String, dynamic> json) {
    final List<dynamic> stringsJson = json['strings'];
    return SampleElement(
      integer: json['int'], 
      string: json['string'], 
      boolean: json['bool'], 
      strings: stringsJson.map((e) => '$e').toList(),
    );
  }
}