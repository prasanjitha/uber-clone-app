// ignore_for_file: constant_identifier_names

enum Complexcity {
  Simple,
  Chalanging,
  Hard,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingrediants;
  final List<String> steps;
  final int durations;
  final Complexcity complexsity;
  final bool isGlutenFree;

  Meal(
      {required this.id,
      required this.categories,
      required this.title,
      required this.imageUrl,
      required this.complexsity,
      required this.durations,
      required this.ingrediants,
      required this.isGlutenFree,
      required this.steps});
}
