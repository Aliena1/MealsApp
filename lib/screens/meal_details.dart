import 'package:flutter/material.dart';
import '../models/meal.dart';

class MealDetails extends StatelessWidget {
  const MealDetails({super.key,
  required this.meal,
  required this.onToggleFavorite,
  });

  final Meal meal;
  final void Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: (){
                onToggleFavorite(meal);
              },
              icon: Icon(Icons.star)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(meal.imageUrl,width: double.infinity,height: 300,fit: BoxFit.cover,),
            SizedBox(height: 14,),
            Text("Ingredients",style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            ),
            ),
            for(final ingredients in meal.ingredients)
            Text(ingredients,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),),
            SizedBox(height: 24,),
            Text("Steps",style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold
            ),
            ),
            for(final steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
                child: Text(steps,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),),
              ),
          ],
        ),
      ),
    );
  }
}
