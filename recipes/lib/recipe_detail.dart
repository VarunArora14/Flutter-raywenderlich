import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  // TODO: Add _sliderval here
  int _sliderval = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),

            const SizedBox(
              height: 4.0,
            ),
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18.0),
            ),
            // TODO: Add expanded
            Expanded(
              child: ListView.builder(
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // TODO: Add ingredient quantity
                  return Text('${ingredient.quantity * _sliderval} '
                      '${ingredient.measure} '
                      '${ingredient.name} ');
                },
              ),
            ),

            // TODO: Add slider
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: '${_sliderval * widget.recipe.servings} servings',
              value: _sliderval.toDouble(),
              onChanged: (newval) {
                setState(
                  () {
                    _sliderval = newval.round();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
