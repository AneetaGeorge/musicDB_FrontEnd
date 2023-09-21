class ReleaseGroup {
  String id;
  String title;
  String primaryType;
  String? secondaryType;
  String firstReleaseDate;
  //TODO: Add Artist credit and Release attribute

  ReleaseGroup({required this.id, required this.title, required this.primaryType, required this.secondaryType, required this.firstReleaseDate});

  //TODO: Add .fromJSON constructor
}