import 'package:flutter/material.dart';
import 'package:recipes/recipe.dart';
import 'recipe_detail.dart';
// import 'dart:math' as math;

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Recipe Calculator',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.orange[300],
          secondary: Colors.orange[600],
        ),
      ),
      home: const HomePage(title: 'Recipe Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.orange[300],
        child: ListView.builder(
          itemCount: Recipe.samples.length,
          itemBuilder: (context, index) {
            // update to return the recipe card
            // TODO: Add gesture detector
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // TODO: Replace return with return RecipeDetail()
                      return RecipeDetail(recipe: Recipe.samples[index]);
                    },
                  ),
                );
              },
              child: buildRecipeCard(Recipe.samples[index]),
            );
            // return Text(Recipe.samples[index].label);
          },
        ),
      ),
    );
  }

  // Add buildrecipe() here
  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      //     .withOpacity(1.0),
      // the above is for random color for each card
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image(
              image: AssetImage(recipe.imageUrl),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              recipe.label,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
