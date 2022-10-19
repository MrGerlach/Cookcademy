Hi All,

This project is dedicated to building an app with cooking recipes. 

## The app is designed to:
1. Show the user the categories of meals
2. After selecting a category, the user sees a list of recipes
3. the user can add his own recipe
4. After selecting an existing recipe, the user sees a list of ingredients and preparation method
5. Each recipe can be added to favorites
6. The user can choose the font color and whether the optional steps should be visible 
7. Each recipe can be edited
8. All changes are saved in the file system

## What you can find in this project?
### 1. Views
- MainTabView - default view in app, allows to switch between recipes, favorites and settings.
- SettingsView - design to choose list background color and text color. Optional steps can be hidden.

#### ExploreRecipes
- RecipeCategiryGridView - View with categories of the recipes
- RecipeListView - List with recipes in chosen category
- RecipeDetailView - View shows ingredients and steps to prepare the chosen meal. The recipe can be added to favorites or be edited.

#### ModifyRecipes
- ModifyRecipeView - allows for editing and adding recipe, switching between other modify views. Presented as a sheet. 
- ModifyMainIngormationView - add or edit main informations
- ModifyComponenetsView - add or edit list of ingredients or directions
- ModifyIngredientView - add or edit ingredient
- ModifyDirectionView - add or edit directions


### 2. Models
- Recipe - contains all recipes, categories, descriptions, ingredients etc.

### 3. ViewModels 
- AppColor - conatins colors used in the app
- RecipeData - is responsible for showing recipes from chosen category, saving and loading recipes.
