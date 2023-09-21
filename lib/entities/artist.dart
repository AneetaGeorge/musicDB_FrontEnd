class Artist {
  String id;
  String name;
  String sortName;
  String? type;
  String? country;
  String? gender;
  String? disambiguation;
  List<Alias>? aliases;

  Artist({required this.id, required this.name, required this.sortName, this.type, this.country, this.gender, this.disambiguation, this.aliases});
}

class Alias {
  String sortName;
  String typeId;
  String name;
  String? locale;
  String type;
  bool? primary;

  Alias({required this.sortName, required this.typeId, required this.name, this.locale, required this.type, this.primary});
}