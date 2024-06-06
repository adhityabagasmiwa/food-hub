class Endpoints {
  String baseUrl;

  Endpoints(this.baseUrl);

  String get mealCategory => 'categories.php';
  String get mealDetail => 'lookup.php';
  String get mealSearch => 'search.php';
  String get mealByCategory => 'filter.php';
}
