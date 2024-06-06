class Meal {
  final String idMeal;
  final String strMeal;
  final String strDrinkAlternate;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strYoutube;
  final List<String> strTags;
  final List<String> ingredients;
  final List<String> measures;

  Meal({
    required this.idMeal,
    required this.strMeal,
    required this.strDrinkAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strYoutube,
    required this.strTags,
    required this.ingredients,
    required this.measures,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<String> tags = [];
    if (json['strTags'] != null && json['strTags'].isNotEmpty) {
      tags = (json['strTags'] as String).split(',');
    }

    List<String> ingredients = [];
    List<String> measures = [];
    for (int i = 1; i <= 20; i++) {
      String ingredientKey = 'strIngredient$i';
      String measureKey = 'strMeasure$i';

      if (json[ingredientKey] != null &&
          json[ingredientKey].toString().isNotEmpty) {
        ingredients.add(json[ingredientKey]);
      }
      if (json[measureKey] != null && json[measureKey].toString().isNotEmpty) {
        measures.add(json[measureKey]);
      }
    }

    return Meal(
      idMeal: json['idMeal'] ?? '',
      strMeal: json['strMeal'] ?? '',
      strDrinkAlternate: json['strDrinkAlternate'] ?? '',
      strCategory: json['strCategory'] ?? '',
      strArea: json['strArea'] ?? '',
      strInstructions: json['strInstructions'] ?? '',
      strMealThumb: json['strMealThumb'] ?? '',
      strYoutube: json['strYoutube'] ?? '',
      strTags: tags,
      ingredients: ingredients,
      measures: measures,
    );
  }

  Map<String, dynamic> toJson() {
    String tagsString = strTags.join(',');

    Map<String, String> ingredientsMap = {};
    Map<String, String> measuresMap = {};
    for (int i = 0; i < ingredients.length; i++) {
      ingredientsMap['strIngredient${i + 1}'] = ingredients[i];
      measuresMap['strMeasure${i + 1}'] = measures[i];
    }

    for (int i = ingredients.length; i < 20; i++) {
      ingredientsMap['strIngredient${i + 1}'] = '';
      measuresMap['strMeasure${i + 1}'] = '';
    }

    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strDrinkAlternate': strDrinkAlternate,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strYoutube': strYoutube,
      'strTags': tagsString,
      ...ingredientsMap,
      ...measuresMap,
    };
  }
}
