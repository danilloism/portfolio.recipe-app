import 'package:flutter/material.dart';
import 'package:portfolio_recipe_app/recipe.dart';
import 'package:portfolio_recipe_app/utils.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(
                widget.recipe.imageUrl,
              ),
            ),
            Gap.gapH16,
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (context, index) {
                  //TODO: Add ingredient.quantity
                  final ingredient = widget.recipe.ingredients[index];

                  return Text(
                    "${ingredient.quantity} ${ingredient.measure} ${ingredient.name}",
                  );
                },
              ),
            ),
            Slider(
              min: 1,
              max: 10,
              divisions: 10,
              label: "${_sliderValue * widget.recipe.servings} servings",
              value: _sliderValue.toDouble(),
              onChanged: (value) => setState(
                () {
                  _sliderValue = value.round();
                },
              ),
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
