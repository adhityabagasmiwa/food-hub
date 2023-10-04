class Recipe {
  int id, totalRating;
  String name, photoUrl, description;
  List<String> ingredients;
  double rating;
  List<RecipeStep> recipeStep;
  Category category;
  Creator creator;

  Recipe({
    required this.id,
    required this.totalRating,
    required this.name,
    required this.photoUrl,
    required this.description,
    required this.ingredients,
    required this.rating,
    required this.recipeStep,
    required this.category,
    required this.creator,
  });

  static final Recipe defaultValue = Recipe(
    id: 0,
    totalRating: 0,
    name: '',
    photoUrl: '',
    description: '',
    ingredients: [],
    rating: 0,
    recipeStep: [],
    category: Category(id: 0, name: ''),
    creator: Creator(id: 0, name: '', photoUrl: ''),
  );

  static List<Recipe> trendingRecipes = [
    Recipe(
      id: 1,
      totalRating: 10,
      name: 'Pancake',
      photoUrl: 'img_pancake.png',
      description:
          'Pancakes are cakes made from flour, chicken eggs, S and milk. These ingredients are mixed with water to form a thick dough which is fried on a flat pan greased with a little oil. This cake is eaten with added butter and maple syrup, jam, or honey. Apart from that, pancakes are also often eaten with cheese, berries and sliced meat.',
      ingredients: [
        '1 ½ Cups All-Purpose Flour',
        '3 ½ Teaspoons Baking Powder',
        '1 Tablespoon White Sugar',
        '1/2 Teaspoon Salt',
        '1 ¼ Cups Milk',
        '3 Tablespoons Butter, Melted',
        '1 Egg',
      ],
      rating: 4.0,
      recipeStep: [
        RecipeStep(
          number: 1,
          description:
              'Sift flour, baking powder, sugar, and salt together in a large bowl. Make a well in the center and add milk, melted butter, and egg; mix until smooth.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Heat a lightly oiled griddle or pan over medium-high heat. Pour or scoop the batter onto the griddle, using approximately 1/4 cup for each pancake; cook until bubbles form and the edges are dry, about 2 to 3 minutes. Flip and cook until browned on the other side. Repeat with remaining batter.',
        ),
      ],
      category: Category(id: 1, name: 'Snack'),
      creator: Creator(id: 1, name: 'Kenzo', photoUrl: 'ic_creator_1.png'),
    ),
    Recipe(
      id: 2,
      totalRating: 35,
      name: 'French toast',
      photoUrl: 'img_french_toast.png',
      description:
          'French toast is a dish of sliced bread soaked in beaten eggs and often milk or cream, then pan fried. Alternative names and variants include eggy bread, Bombay toast, gypsy toast, and poor knights.',
      ingredients: [
        '1/2 Cup Milk',
        '2 Large Eggs',
        'Salt',
        '6 Thick Slices Bread',
      ],
      rating: 4.5,
      recipeStep: [
        RecipeStep(
          number: 1,
          description: 'Gather all ingredients.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Whisk milk, eggs, vanilla, cinnamon, and salt together in a shallow bowl.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Lightly butter a griddle or skillet and heat over medium-high heat.',
        ),
        RecipeStep(
          number: 4,
          description: 'Dunk bread in the egg mixture, soaking both sides.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Transfer to the hot skillet and cook until golden, 3 to 4 minutes per side.',
        ),
        RecipeStep(
          number: 5,
          description: 'Serve hot.',
        ),
      ],
      category: Category(id: 1, name: 'Snack'),
      creator: Creator(id: 2, name: 'Reto', photoUrl: 'ic_creator_2.png'),
    ),
    Recipe(
      id: 3,
      totalRating: 60,
      name: 'Spaghetti Italian',
      photoUrl: 'img_spaghetti.png',
      description:
          'Italian spaghetti is typically made from durum-wheat semolina. Usually the pasta is white because refined flour is used, but whole wheat flour may be added.',
      ingredients: [
        '1/2 Pound Ground Beef',
        '3/4 Cup Thinly Sliced Green Onions',
        '3 Cans (8 Ounces Each) Tomato Sauce',
        '2 Teaspoons Sugar',
        '1 Teaspoon Worcestershire Sauce',
        '1/2 Teaspoon Salt',
        '1/8 Teaspoon Pepper',
        '1 Can (2-1/4 Ounces) Sliced Ripe Olives, Drained',
        'Cooked Spaghetti',
        'Grated Parmesan Cheese',
        'Bacon Bits, Optional',
      ],
      rating: 4.8,
      recipeStep: [
        RecipeStep(
          number: 1,
          description:
              'In a large skillet, brown sausage over medium heat; drain and set aside.',
        ),
        RecipeStep(
          number: 2,
          description:
              'In a large saucepan over medium heat, combine tomato sauce, diced tomatoes, bay leaves, Italian seasoning, garlic powder, basil, oregano, salt, pepper and Italian sausage; mix well.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Simmer over medium-low heat for at least one hour; it is best if simmered all day.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Bring a large pot of lightly salted water to a boil. Add pasta and cook for 8 to 10 minutes or until al dente; drain.',
        ),
        RecipeStep(
          number: 5,
          description: 'Mix sauce with hot pasta; serve.',
        ),
      ],
      category: Category(id: 2, name: 'Noodles'),
      creator: Creator(id: 3, name: 'Mika', photoUrl: 'ic_creator_3.png'),
    ),
  ];

  static List<Recipe> popularRecipes = [
    Recipe(
      id: 4,
      totalRating: 80,
      name: 'Fried Rice',
      photoUrl: 'img_fried_rice.png',
      description:
          'Fried rice is a traditional Chinese preparation of cooked rice, vegetables, protein, soy sauce, and aromatics. The ingredients are stir-fried in a large pan or wok for even flavor distribution. An ideal use for leftovers, fried rice is quick, customizable, and incredibly simple to put together with whatever is in your fridge.',
      ingredients: [
        '2/3 Cup Chopped Baby Carrots',
        '1/2 Cup Frozen Green Peas',
        '2 Tablespoons Vegetable Oil',
        '1 Clove Garlic, Minced',
        '2 Large Eggs',
        '3 Cups Leftover Cooked White Rice',
        '1 Tablespoon Soy Sauce',
        '2 Teaspoons Sesame Oil',
      ],
      rating: 4.2,
      recipeStep: [
        RecipeStep(
          number: 1,
          description: 'Assemble Ingredients.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Place carrots in a small saucepan and cover with water. Bring to a low boil and cook for 3 to 5 minutes. Stir in peas, then immediately drain in a colander.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Heat a wok over high heat. Pour in vegetable oil, then stir in carrots, peas, and garlic; cook for about 30 seconds. Add eggs; stir quickly to scramble eggs with vegetables.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Stir in cooked rice. Add soy sauce and toss rice to coat. Drizzle with sesame oil and toss again.',
        ),
        RecipeStep(
          number: 5,
          description: 'Serve hot and enjoy!',
        ),
      ],
      category: Category(id: 3, name: 'Rice'),
      creator: Creator(id: 3, name: 'Mika', photoUrl: 'ic_creator_3.png'),
    ),
    Recipe(
      id: 5,
      totalRating: 100,
      name: 'Candied Almonds',
      photoUrl: 'img_almonds.png',
      description:
          'Candied almonds are nuts that have been cooked in a special way, so they end up coated in browned, crunchy sugar. Candied almonds are cooked by heating brown sugar or white sugar, cinnamon and water in a pan then dipping the almonds in the sugar mixture.',
      ingredients: [
        '1 Cup White Sugar',
        '1/2 Cup Water',
        '1 Tablespoon Ground Cinnamon',
        '2 Cups whole Almonds',
      ],
      rating: 4.2,
      recipeStep: [
        RecipeStep(
          number: 1,
          description: 'Line a baking sheet with waxed paper.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Combine sugar, water, and cinnamon in a saucepan over medium heat; bring to a boil. Add almonds; cook and stir mixture until liquid evaporates and leaves a syrupy coating on almonds.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Pour almonds onto the prepared baking sheet; use two forks to separate clumps and spread into an even layer. Allow to cool for about 15 minutes.',
        ),
      ],
      category: Category(id: 1, name: 'Snack'),
      creator: Creator(id: 1, name: 'Kenzo', photoUrl: 'ic_creator_1.png'),
    ),
    Recipe(
      id: 6,
      totalRating: 75,
      name: 'Sesame Noodles',
      photoUrl: 'img_sesame_noodles.png',
      description:
          ' Sesame Noodles tossed in a fabulous Asian Sesame Peanut Dressing! Terrific served at room temperature or warm, this is a great side dish.',
      ingredients: [
        '1 (16 Ounce) Package Linguine Pasta',
        '6 cloves Garlic, Minced',
        '6 Tablespoons Sugar',
        '6 Tablespoons Safflower Oil',
        '6 Tablespoons Rice Vinegar',
        '6 Tablespoons Soy Sauce',
        '2 Tablespoons Sesame Oil',
        '2 Teaspoons Chili Sauce',
        '6 Green Onions, Sliced',
        '1 Teaspoon Sesame Seeds, Toasted',
      ],
      rating: 4.2,
      recipeStep: [
        RecipeStep(
          number: 1,
          description:
              'Bring a pot of lightly salted water to boil. Add pasta, and cook until al dente, about 8 to 10 minutes. Drain, and transfer to a serving bowl.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Meanwhile, place a saucepan over medium-high heat. Stir in garlic, sugar, oil, vinegar, soy sauce, sesame oil, and chili sauce. Bring to a boil, stirring constantly, until sugar dissolves. Pour sauce over linguine, and toss to coat. Garnish with green onions and sesame seeds.',
        ),
      ],
      category: Category(id: 2, name: 'Noodles'),
      creator: Creator(id: 2, name: 'Reto', photoUrl: 'ic_creator_2.png'),
    ),
  ];
}

class Category {
  int id;
  String name;

  Category({required this.id, required this.name});

  static List<Category> categoryRecipes = [
    Category(id: 0, name: 'All'),
    Category(id: 1, name: 'Snack'),
    Category(id: 2, name: 'Noodles'),
    Category(id: 3, name: 'Rice'),
  ];
}

class Creator {
  int id;
  String name, photoUrl;

  Creator({required this.id, required this.name, required this.photoUrl});
}

class RecipeStep {
  int number;
  String description;

  RecipeStep({
    required this.number,
    required this.description,
  });
}
